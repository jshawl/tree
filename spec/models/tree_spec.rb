require_relative '../spec_helper.rb'
require_relative '../../models/repo.rb'
require_relative '../../models/tree.rb'

describe Tree do
  it "should have files" do
    @tree = Tree.new('jesse.sh','af20443102488bf6985492461ea5baf1381c648f','_drafts')
    expect(@tree.files.class).to eq(Rugged::Tree)
  end
end