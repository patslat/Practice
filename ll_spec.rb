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

    describe '#reverse' do
      it 'returns the head of a new reversed ll' do
        reversed = root.reverse
        expected = 3
        expect(reversed.key).to eq(expected)
        reversed.each do |n|
          expect(n.key).to eq(expected)
          expected -= 1
        end
      end

      it 'is non destructive' do
        root.reverse
        expect(root.key).to be(1)
        expected = 1
        root.each do |node|
          expect(node.key).to eq(expected)
          expected += 1
        end
      end
    end

    describe '#reverse!' do
      it 'returns the head of the reversed ll' do
        expected = 3
        reversed = root.reverse!
        expect(reversed.key).to eq(expected)
        reversed.each do |node|
          expect(node.key).to eq(expected)
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

    describe '#length' do
      it 'returns an int representing the length' do
        expect(root.length).to be(10)
      end

      it 'should return a new length after deletion' do
        root.delete(2)
        expect(root.length).to be(9)
      end
    end

    describe '#index' do
      it 'should return the index of a value' do
        expect(root.index(5)).to be(4)
      end
    end

    describe '#at' do
      it 'returns the key at given index' do
        expect(root.at(0).key).to be(1)
        expect(root.at(5).key).to be(6)
      end
    end

    describe '#[]' do
      it 'returns the key at given index' do
        expect(root[5].key).to be(6)
      end
    end

    describe '#delete_at' do
      it 'deletes the node at given index' do
        root.delete_at(2)
        expect(root.child.child.key).to be(4)
      end
    end

  end
end
