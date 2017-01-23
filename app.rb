require 'sinatra'
require 'sinatra/reloader'

require_relative 'models/repo'
require_relative 'models/blob'
require_relative 'models/tree'

also_reload 'models/blob.rb'
also_reload 'models/tree.rb'

get '/' do
  @repos = Repo.all
  erb :'repos/index'
end

get '/:repo' do
  begin
    @repo = Repo.find(params[:repo])
    erb :'repos/show'
  rescue Rugged::OSError => e
    status 404
    "Not found"
  end
end

get '/:repo/blob/:blob/*' do
  @filename = params[:splat][0]
  @blob = Blob.new(params[:repo], params[:blob], @filename)
  @ext = File.extname(@filename)
  erb :'blobs/show'
end

get '/:repo/tree/:oid/*' do
  @tree = Tree.new(params[:repo],params[:oid], params[:splat][0])
  erb :'trees/show'
end
