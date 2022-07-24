require "sinatra"
require "net/http"
require "json"

class Worker
  def initialize(p, timer = 1000)
    @func = p
    @timer = timer
  end

  def do_work
    Thread.new do
      while true
        @func.call
        sleep @timer
      end
    end
  end
end

$data = nil

worker = Worker.new(proc do 
  response = Net::HTTP.get(URI 'https://api.github.com/users/dfitw/repos')
  $data = JSON.parse response
end, 300000)

worker.do_work

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
  render_page :projects
end

get '/*' do
  status 404
  haml :not_found, :format => :html5
end
