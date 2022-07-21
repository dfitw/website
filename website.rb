require "sinatra"

def render_page(page)
  haml page, :format => :html5, :layout => :header_layout
end

set :public_folder, 'public'

get '/' do
  render_page :index
end

get '/info' do
  haml :info, :format => :html5
end

get '/contact' do
  haml :contact, :format => :html5, :layout => :header_layout
end

get '/*' do
  status 404
  haml :not_found, :format => :html5
end
