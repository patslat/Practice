require 'rspec'
require './tree.rb'

describe 'TreeNode' do
  subject(:root) { TreeNode.new(5) }
  before :each do
    10.times { |n| next if n == 5; root.add_child(n) }
  end

  describe '#bfs' do
    it 'finds a 3' do
      subject.bfs(3).key.should == 3
    end
  end

  describe 'dfs' do
    it 'finds a 3' do
      subject.dfs(3).key.should == 3
    end
  end

end
