---
layout: page
title: Blog
permalink: /blog/
order: 5
---

{% for post in site.posts %}
  <article>
    <h2>
      <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
    </h2>
    <time datetime="{{ post.date | date: "%Y-%m-%d" }}">{{ post.date | date: "%Y-%m-%d" }}</time>
    {{ post.excerpt }}
  </article>
  {% unless forloop.last %}
    <hr>
  {% endunless %}
{% endfor %}
