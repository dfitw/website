require "sinatra"

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
  posts.to_s
end
