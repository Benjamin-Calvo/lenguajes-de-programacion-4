require "rubygems"
require "sinatra"
require "haml"
require "instagram"
require "twitter"

get '/' do
	haml :index
end

get '/busqueda' do
	haml :blogform
end


