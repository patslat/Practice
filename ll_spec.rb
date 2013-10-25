require 'rspec'
require './ll.rb'

describe LL do
  subject(:root) { LL.new(1) }
  describe '#add' do
    it 'takes a key and adds a child' do
      root.add(2)
      expect(root.child.key).to be(2)
    end
  end

  context '1..3' do
    before do
      root.add(2)
      root.add(3)
    end

    describe '#delete' do

      it 'does not dereference the list if you delete the first item' do
        root.delete(1)
        expect(root.key).to be(2)
      end
      it 'removes the item without breaking the list' do
        root.delete(2)
        expect(root.child.key).to be(3)
      end
    end

    describe '#reverse!' do
      it 'returns the head of the reversed ll' do
        expected = 3
        reversed = root.reverse!
        expect(reversed.key).to eq(expected)
        reversed.each do |n|
          expect(n.key).to eq(expected)
          expected -= 1
        end
      end
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
