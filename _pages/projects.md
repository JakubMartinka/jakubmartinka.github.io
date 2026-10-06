---
layout: page
title: Projects
permalink: /projects/
nav: true
nav_order: 3
---

<!-- pages/projects.md -->

## Code

{% if site.data.repositories.github_repos %}

<div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% for repo in site.data.repositories.github_repos %}
    {% include repository/repo.liquid repository=repo %}
  {% endfor %}
</div>
{% endif %}

## Other projects

<div class="projects">
  {% assign other_projects = site.projects | where: "category", "other" | sort: "importance" %}
  <div class="row row-cols-1 row-cols-md-3">
    {% for project in other_projects %}
      {% include projects.liquid %}
    {% endfor %}
  </div>
</div>
