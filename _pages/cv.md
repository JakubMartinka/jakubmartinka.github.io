---
layout: none
permalink: /cv/
title: CV
nav: true
nav_order: 5
nav_link: /assets/pdf/CV_JakubMartinka.pdf
---

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>CV – {{ site.first_name }} {{ site.last_name }}</title>
    <link rel="canonical" href="{{ page.nav_link | absolute_url }}">
    <meta http-equiv="refresh" content="0; url={{ page.nav_link | relative_url }}">
  </head>
  <body>
    <a href="{{ page.nav_link | relative_url }}">Open the CV (PDF)</a>
  </body>
</html>
