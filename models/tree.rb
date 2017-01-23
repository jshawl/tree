class Tree
  attr_accessor :repo, :files, :path
  def initialize repo, branch, file
    @repo = Repo.find(repo)
    @path = file
    commit = @repo.rgd.lookup(@repo.rgd.branches[branch].target_id)
    oid = commit.tree.path(file)[:oid]
    @files = @repo.rgd.lookup(oid)
  end
end
