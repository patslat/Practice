require 'rspec'
require './tree.rb'

describe 'TreeNode' do
  subject(:root) { TreeNode.new(5, nil, [TreeNode.new(6), TreeNode.new(4), TreeNode.new(3)]) }

  describe 'breadth first search' do

    it 'finds a 3' do
      subject.bfs(3).value.should == 3
    end

  end

  describe 'depth first search' do

    it 'finds a 3' do
      subject.dfs(3).value.should == 3
    end
  end

end
