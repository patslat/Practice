require 'rspec'
require './ll.rb'

describe LL do
  subject(:root) { LL.new(1) }
  describe '#add' do
    it 'adds a child' do
      root.add(2)
      expect(root.child.key).to be(2)
    end
  end

  context '1..10' do
    before do
      (2..10).each { |n| root.add(n) }
    end

    describe '#each' do
      it 'iterates in order' do
        item = 0
        root.each do |n|
          expect(n.key).to be(item += 1)
        end
      end

    end

  end
end
