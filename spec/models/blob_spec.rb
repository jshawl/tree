require_relative '../spec_helper.rb'
require_relative '../../models/repo.rb'
require_relative '../../models/blob.rb'

describe Blob do
  it "should have a repo" do
    @blob = Blob.new('jesse.sh','31a761d3c5e384851f31ffdcae56bfc351f19a11','.htaccess')
    expect(@blob.repo.class).to eq(Repo)
  end
  it "should have an oid" do
    @blob = Blob.new('jesse.sh','31a761d3c5e384851f31ffdcae56bfc351f19a11','.htaccess')
    expect(@blob.repo.class).to eq(Repo)
  end
  it "should have a filename" do
    @blob = Blob.new('jesse.sh','31a761d3c5e384851f31ffdcae56bfc351f19a11','.htaccess')
    expect(@blob.file).to eq('.htaccess')
  end
  it "should have contents" do
    @blob = Blob.new('jesse.sh','31a761d3c5e384851f31ffdcae56bfc351f19a11','.gitignore')
    expect(@blob.contents).to eq(".sass-cache\n.DS_Store\nnode_modules\n_site\n")
  end
end