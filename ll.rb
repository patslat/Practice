class LL
  include Enumerable
  attr_reader :key, :child
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

  def delete(val)
    if key == val
      @key = child.key
      old_child = child
      new_child = child.child
      @child = new_child
      old_child.child = nil
    elsif child
      child.delete(val)
    end
  end

  def each
    head = self
    while head
      yield head
      head = head.child
    end
  end

  def reverse!
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

  protected
  def child=(ll)
    @child = ll
  end
end
