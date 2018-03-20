###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end

activate :relative_assets
set :relative_links, true
activate :directory_indexes

activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch   = 'gh-pages' # default: gh-pages
end

#activate :redcarpet
set :markdown_engine, :redcarpet
set :markdown, :tables => true #, :autolink => true, :gh_blockcode => true, :fenced_code_blocks => true

activate :google_analytics do |ga|
  ga.tracking_id = '' # Replace with your property ID.
end

#activate :asset_hash

#redirect "press/index.html", to: "press/2016-06-21-flatpak-released.html"
redirect "apps.html", to: "/"
