---
layout: no-title-page
title: Blog
permalink: /blog/
order: 5
---

<div class="tags">
  <h2>Tags</h2>
  {% assign tags = site.posts | map: "tags" | uniq | sort %}
  {% for tag in tags %}
    {% if tag != nil %}
      <button class="tag-btn" data-tag="{{ tag }}">{{ tag }}</button>
    {% endif %}
  {% endfor %}
</div>

<div class="posts">
{% for post in site.posts %}
  <article class="post" data-tags="{{ post.tags | join: ' ' }}">
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
.tags {
  margin-bottom: 2em;
}
.tag-btn {
  display: inline-block;
  padding: 0.3em 0.8em;
  margin: 0.2em;
  border: 1px solid #ccc;
  border-radius: 3px;
  background: #f8f9fa;
  cursor: pointer;
}
.tag-btn.active {
  background: #007bff;
  color: white;
  border-color: #0056b3;
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
  font-size: 0.9em;
}
.post.hidden {
  display: none;
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
  const tagButtons = document.querySelectorAll('.tag-btn');
  const posts = document.querySelectorAll('.post');
  let activeTag = null;

  tagButtons.forEach(button => {
    button.addEventListener('click', function() {
      const tag = this.getAttribute('data-tag');
      
      // Toggle active state
      if (activeTag === tag) {
        activeTag = null;
        tagButtons.forEach(btn => btn.classList.remove('active'));
        posts.forEach(post => post.classList.remove('hidden'));
      } else {
        activeTag = tag;
        tagButtons.forEach(btn => btn.classList.remove('active'));
        this.classList.add('active');
        
        posts.forEach(post => {
          const postTags = post.getAttribute('data-tags').split(' ');
          if (!postTags.includes(tag)) {
            post.classList.add('hidden');
          } else {
            post.classList.remove('hidden');
          }
        });
      }
    });
  });
});
</script>
