---
layout: no-title-page
title: Blog
permalink: /blog/
order: 5
---

<div class="tags">
  <h2>Tags</h2>
  <div class="tag-controls">
    {% assign tags = site.posts | map: "tags" | uniq | sort %}
    {% for tag in tags %}
      {% if tag != nil %}
        <button class="tag-btn" data-tag="{{ tag }}">{{ tag }}</button>
      {% endif %}
    {% endfor %}
    <button class="clear-tags-btn">Clear All</button>
  </div>
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
.tags h2 {
  font-size: 1.5em;
  margin-bottom: 0.5em;
}
.tag-controls {
  margin-top: 0.8em;
}
.tag-btn {
  display: inline-block;
  padding: 0.3em 0.8em;
  margin: 0.2em;
  border: 1px solid #ccc;
  border-radius: 3px;
  background: #f8f9fa;
  cursor: pointer;
  transition: all 0.2s ease;
  font-size: 0.9em;
}
.tag-btn.active {
  background: #007bff;
  color: white;
  border-color: #0056b3;
}
.clear-tags-btn {
  display: inline-block;
  padding: 0.3em 0.8em;
  margin: 0.2em;
  border: 1px solid #dc3545;
  border-radius: 3px;
  background: #fff;
  color: #dc3545;
  cursor: pointer;
  transition: all 0.2s ease;
  font-size: 0.9em;
}
.clear-tags-btn:hover {
  background: #dc3545;
  color: white;
}
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
.post.hidden {
  display: none;
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
  const tagButtons = document.querySelectorAll('.tag-btn');
  const clearButton = document.querySelector('.clear-tags-btn');
  const posts = document.querySelectorAll('.post');
  let activeTags = new Set();

  function updatePosts() {
    if (activeTags.size === 0) {
      posts.forEach(post => post.classList.remove('hidden'));
      return;
    }

    posts.forEach(post => {
      const postTags = post.getAttribute('data-tags').split(' ');
      const hasAllTags = Array.from(activeTags).every(tag => postTags.includes(tag));
      if (hasAllTags) {
        post.classList.remove('hidden');
      } else {
        post.classList.add('hidden');
      }
    });
  }

  tagButtons.forEach(button => {
    button.addEventListener('click', function() {
      const tag = this.getAttribute('data-tag');
      
      if (activeTags.has(tag)) {
        activeTags.delete(tag);
        this.classList.remove('active');
      } else {
        activeTags.add(tag);
        this.classList.add('active');
      }
      
      updatePosts();
    });
  });

  clearButton.addEventListener('click', function() {
    activeTags.clear();
    tagButtons.forEach(btn => btn.classList.remove('active'));
    updatePosts();
  });
});
</script>
