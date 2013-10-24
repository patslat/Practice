class LL
  include Enumerable
  attr_reader :key
  attr_accessor :child
  def initialize(key)
    @key = key
  end

  def add(val)
    if child
      child.add(val)
    else
      @child = LL.new(val)
    end
  end

  def each
    head = self
    while head
      yield head
      head = head.child
    end
  end

  def reverse
    first = self
    second = self.child
    current = self.child
    first.child = nil
    while second
      second = second.child
      current.child = first
      first = current
      current = second
    end
    first
  end
end
