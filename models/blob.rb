require 'rugged'
require 'pry'

class Blob
  attr_accessor :contents, :repo, :file
  def initialize repo, oid, file
    file = file.split('/')[0]
    @repo = Repo.find( repo )
    @file = @repo.tree[file][:name]
    blob = @repo.rgd.lookup(oid)
    @contents = blob.content
  end
end