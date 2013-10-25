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

  def delete_at(i)
    target = self[i]
    target.delete(target.key)
  end

  def length
    length_counter(1)
  end

  def index(val)
    index_helper(val, 0)
  end

  def at(n)
    self[n]
  end

  def [](n)
    return self if n == 0
    return nil if child.nil?
    child[(n - 1)]
  end

  def each
    head = self
    while head
      yield head
      head = head.child
    end
  end

  def reverse
    first = LL.new(self.key)
    if self.child
      second = self.child
      current = LL.new(self.child.key)
    end
    while second
      second = second.child
      current.child = first
      first = current
      current = LL.new(second.key) if second
    end
    first
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
  def length_counter(n)
    return n if child.nil?
    child.length_counter(n + 1)
  end

  def index_helper(val, n)
    return n if key == val
    return nil if child.nil?
    child.index_helper(val, n + 1)
  end

  def child=(ll)
    @child = ll
  end
end
