require 'rugged'

class Blob
  attr_accessor :contents, :repo, :file
  def initialize repo, file
    @file = file
    @repo = Repo.find( repo )
    oid = @repo.tree[file][:oid]
    blob = @repo.rgd.lookup(oid)
    @contents = blob.content
  end
end