class Tree
  attr_accessor :repo
  def initialize repo, file
    @repo = Repo.find(repo)
  end
end
