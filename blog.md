---
layout: no-title-page
title: Blog
permalink: /blog/
order: 5
---

<div class="posts">
{% for post in site.posts %}
  <article class="post">
    <h2>
      <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
    </h2>
    <div class="post-meta">
      <time datetime="{{ post.date | date: "%Y-%m-%d" }}">{{ post.date | date: "%Y-%m-%d" }}</time>
      {% if post.tags %}
        <span class="tags">
          {% for tag in post.tags %}
            <span class="tag">{{ tag }}</span>
          {% endfor %}
        </span>
      {% endif %}
    </div>
    {{ post.excerpt }}
  </article>
  {% unless forloop.last %}
    <hr>
  {% endunless %}
{% endfor %}
</div>

<style>
.post {
  margin-bottom: 2em;
}
.post h2 {
  font-size: 1.3em;
  margin-bottom: 0.3em;
}
.post h2 a {
  color: #333;
  text-decoration: none;
}
.post h2 a:hover {
  color: #007bff;
}
.post-meta {
  margin: 0.5em 0;
  color: #666;
}
.post-meta .tag {
  display: inline-block;
  padding: 0.1em 0.5em;
  margin: 0 0.2em;
  background: #f0f0f0;
  border-radius: 3px;
  font-size: 0.85em;
}
</style>
