require 'sinatra'
require 'sinatra/reloader'

require_relative 'models/repo'
require_relative 'models/blob'

get '/' do
  @repos = Repo.all
  erb :'repos/index'
end

get '/:repo' do
  @repo = Repo.find(params[:repo])
  erb :'repos/show'
end

get '/:repo/blob/master/:file' do
  @blob = Blob.new(params[:repo], params[:file])
  erb :'blobs/show'
end