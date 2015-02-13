require 'rugged'
require 'pry'

class Blob
  attr_accessor :contents, :repo, :file
  def initialize repo, oid, file
    @repo = Repo.find( repo )
    @file = @repo.tree[file][:name]
    blob = @repo.rgd.lookup(oid)
    @contents = blob.content
  end
end