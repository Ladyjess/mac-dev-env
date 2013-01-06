Dotenv.load

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

configure :build do
  activate :minify_css
  activate :minify_javascript

  use Rack::GoogleAnalytics, :web_property_id => ENV['GOOGLE_ANALYTICS']
  use Rack::Gauges, :tracker => ENV['GAUGES']
end

activate :deploy do |deploy|
  deploy.method = :rsync
  deploy.user = ENV['RSYNC_USER']
  deploy.host = ENV['RSYNC_HOST']
  deploy.path = ENV['RSYNC_PATH']
  deploy.clean = true
end