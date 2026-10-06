# jakubmartinka.github.io

Personal website of Jakub Martinka, built with Jekyll on the [al-folio](https://github.com/alshedivat/al-folio) theme.
Pushing to `master` deploys the site via GitHub Actions.

## Run locally

Uses the rbenv Ruby 3.3.0:

```bash
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - bash)"
bundle install            # first time only
bundle exec jekyll serve --livereload
```

Then open http://localhost:4000.

## Where things are

- `_pages/` – navbar pages (About, Publications, Projects, CV, Teaching, Travel map)
- `_bibliography/papers.bib` – publications; extra fields add buttons: `summary = {/publications/...}` (Post), `code = {https://github.com/...}` (GitHub), `bibtex_show = {true}` (Bib); the DOI gives the Paper button
- `_projects/` – summary pages; `category: publication` with `permalink: /publications/<name>/` (linked from Publications) or `category: other` (shown on Projects)
- `_data/repositories.yml` – GitHub repositories shown on the Projects page
- `_data/travel.yml` – visited countries and places for the travel map
- `_sass/_themes.scss` – colour scheme (Gruvbox)
