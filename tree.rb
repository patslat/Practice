class TreeNode
  attr_accessor :value, :children
  def initialize(value, parent = nil, children = [])
    @value, @parent, @children = value, parent, children
  end

  def add_child(value)
    @children << TreeNode.new(value, self)
  end

  def bfs(value)
    return self if @value == value
    q = [self]
    while current = q.shift
      return current if current.value == value
      q += current.children
    end
    nil
  end

  def dfs(value)
    return self if @value == value
    stack = [self]
    while current = stack.pop
      return current if current.value == value
      stack += current.children
    end
    nil
  end
end
