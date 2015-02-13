require 'sinatra'
require 'sinatra/reloader'

require_relative 'models/repo'
require_relative 'models/blob'
require_relative 'models/tree'

get '/' do
  @repos = Repo.all
  erb :'repos/index'
end

get '/:repo' do
  @repo = Repo.find(params[:repo])
  erb :'repos/show'
end

get '/:repo/blob/:blob/:filename' do
  @blob = Blob.new(params[:repo], params[:blob], params[:filename])
  erb :'blobs/show'
end

get '/:repo/tree/:oid/:file' do
  @tree = Tree.new(params[:repo],params[:oid], params[:file])
  erb :'trees/show'
end