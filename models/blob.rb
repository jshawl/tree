require 'rugged'
require 'htmlentities'
require 'pry'

class Blob
  attr_accessor :contents, :repo, :file
  def initialize repo, branch, file
    @repo = Repo.find( repo )
    @file = file
    commit = @repo.rgd.lookup(@repo.rgd.branches[branch].target_id)
    blob = @repo.rgd.lookup(commit.tree.path(file)[:oid])
    @contents = HTMLEntities.new.encode(blob.content)
  end
end
