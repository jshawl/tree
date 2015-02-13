class Tree
  attr_accessor :repo, :files, :path
  def initialize repo, oid, file
    @repo = Repo.find(repo)
    @path = file
    @files = @repo.rgd.lookup(oid)
  end
end
