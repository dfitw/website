require "sinatra"
require "net/http"
require "json"

def render_page(page)
  haml page, :format => :html5, :layout => :header_layout
end

set :public_folder, 'public'

get '/' do
  render_page :index
end

get '/info' do
  render_page :info
end

get '/contact' do
  render_page :contact
end

get '/projects' do 
  response = Net::HTTP.get(URI 'https://api.github.com/users/dfitw/repos')
  @data = JSON.parse response
  render_page :projects
end

get '/*' do
  status 404
  haml :not_found, :format => :html5
end
