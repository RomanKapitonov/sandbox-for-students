require "rubygems"
require "bundler/setup"
require "sinatra"
require "sinatra/reloader"

configure do
  set :views, "#{File.dirname(__FILE__)}/views"

  register Sinatra::Reloader
end

helpers do
  def read_data
    JSON.parse(File.open('templates/data.json').read)
  end
end

get "/" do
  liquid :index, :locals => read_data
end
