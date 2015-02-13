require 'rugged'
require 'htmlentities'
require 'pry'

class Blob
  attr_accessor :contents, :repo, :file
  def initialize repo, oid, file
    file = file.split('/')[0]
    @repo = Repo.find( repo )
    @file = @repo.tree[file][:name]
    blob = @repo.rgd.lookup(oid)
    @contents = HTMLEntities.new.encode(blob.content)
  end
end