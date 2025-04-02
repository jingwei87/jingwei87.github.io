source "https://rubygems.org"

# GitHub Pages
gem "github-pages", "~> 228", group: :jekyll_plugins

# Basic dependencies
gem "jekyll", "~> 3.9.3"
gem "kramdown-parser-gfm"
gem "webrick"

# Plugins
group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.15.1"
  gem "jekyll-remote-theme"
  gem "jekyll-seo-tag", "~> 2.8.0"
end

# Windows and JRuby does not include zoneinfo files
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

# Windows Directory Monitor
gem "wdm", "~> 0.1", :platforms => [:mingw, :x64_mingw, :mswin]

# JRuby HTTP Parser
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]
