require 'rspec'
require './tree.rb'

describe 'TreeNode' do
  subject(:root) { TreeNode.new(5) }

  describe 'breadth first search' do
    before :each do
      10.times { |n| root.add_child(n) }
      p root.inorder
    end

    it 'finds a 3' do
      subject.bfs(3).key.should == 3
    end
  end

end
