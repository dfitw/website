require "sinatra"

set :public_folder, 'public'

get '/' do
  haml :index, :format => :html5
end

get '/boobs' do 
  "boobs"
end

posts = []
post '/blog' do
  payload = JSON.parse(request.body.read)
  posts << payload["name"]
end

get '/*' do
  status 404
  haml :not_found, :format => :html5
end
