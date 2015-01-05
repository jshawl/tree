require 'rugged'
class Repo
  attr_accessor :title, :path, :url, :tree, :rgd
  def self.all
    Dir['repos/*'].map do |repo|
      repo.split('/')[1].split('.git')[0]
    end
  end
  def self.find repo
    @repo = Repo.new
    @repo.title = repo
    @repo.path = 'repos/' + repo + '.git'
    @repo.url = '/' + repo
    @repo.rgd = Rugged::Repository.new(@repo.path)
    tree = @repo.rgd.lookup( @repo.rgd.head.target ).tree
    @repo.tree = tree

    return @repo
  end
end
