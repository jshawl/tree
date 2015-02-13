class Tree
  attr_accessor :repo, :files
  def initialize repo, oid, file
    @repo = Repo.find(repo)
    @files = @repo.rgd.lookup(oid)
  end
end
