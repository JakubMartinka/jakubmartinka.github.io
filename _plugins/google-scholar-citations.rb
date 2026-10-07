require "active_support/all"
require 'nokogiri'
require 'open-uri'
require 'yaml'

module Helpers
  extend ActiveSupport::NumberHelper
end

module Jekyll
  # Fetches Google Scholar citation counts at build time. Google often blocks requests from
  # GitHub Actions, so successful counts are stored in _data/citations.yml (commit it) and
  # used as a fallback whenever a fetch fails.
  class GoogleScholarCitationsTag < Liquid::Tag
    Citations = { }

    def initialize(tag_name, params, tokens)
      super
      splitted = params.split(" ").map(&:strip)
      @scholar_id = splitted[0]
      @article_id = splitted[1]
    end

    def cache_path(context)
      File.join(context.registers[:site].source, "_data", "citations.yml")
    end

    def read_cache(path)
      File.exist?(path) ? (YAML.safe_load(File.read(path)) || {}) : {}
    rescue StandardError
      {}
    end

    def format_count(count)
      Helpers.number_to_human(count, :format => '%n%u', :precision => 2, :units => { :thousand => 'K', :million => 'M', :billion => 'B' })
    end

    def fetch_count(article_url)
      # Sleep for a random amount of time to avoid being blocked
      sleep(rand(1.5..3.5))

      doc = Nokogiri::HTML(URI.open(article_url, "User-Agent" => "Ruby/#{RUBY_VERSION}"))

      # A blocked request (captcha page) has no description meta; don't mistake it for 0 citations
      meta = doc.css('meta[name="description"]').first || doc.css('meta[property="og:description"]').first
      raise "no description meta (blocked by Google?)" unless meta

      matches = meta['content'].to_s.match(/Cited by (\d+[,\d]*)/)
      matches ? matches[1].delete(",").to_i : 0
    end

    def render(context)
      article_id = context[@article_id.strip]
      scholar_id = context[@scholar_id.strip]
      article_url = "https://scholar.google.com/citations?view_op=view_citation&hl=en&user=#{scholar_id}&citation_for_view=#{scholar_id}:#{article_id}"

      # If the citation count has already been fetched in this build process, return it
      return GoogleScholarCitationsTag::Citations[article_id] if GoogleScholarCitationsTag::Citations[article_id]

      path = cache_path(context)
      cache = read_cache(path)

      begin
        count = fetch_count(article_url)
        # Only write on change, so `jekyll serve` doesn't rebuild in a loop
        if cache[article_id] != count
          cache[article_id] = count
          File.write(path, cache.sort.to_h.to_yaml)
        end
        citation_count = format_count(count)
      rescue Exception => e
        if cache.key?(article_id)
          citation_count = format_count(cache[article_id])
          puts "Error fetching citation count for #{article_id}: #{e.class} - #{e.message} (using cached #{citation_count})"
        else
          citation_count = "N/A"
          puts "Error fetching citation count for #{article_id}: #{e.class} - #{e.message}"
        end
      end

      GoogleScholarCitationsTag::Citations[article_id] = citation_count
      return "#{citation_count}"
    end
  end
end

Liquid::Template.register_tag('google_scholar_citations', Jekyll::GoogleScholarCitationsTag)
