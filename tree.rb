class TreeNode
  attr_reader :key, :left, :right
  def initialize(key)
    @key = key
  end

  def add_child(n)
    if n < key && !left
      @left = TreeNode.new(n)
    elsif n < key
      @left.add_child(n)
    elsif n >= key && !right
      @right = TreeNode.new(n)
    else
      @right.add_child(n)
    end
  end

  def inorder
    left.inorder if left
    puts key
    right.inorder if right
  end

  def bfs(target)
    q = [self]
    while current = q.shift
      return current if current.key == target
      q << current.left if current.left
      q << current.right if current.right
    end
    nil
  end

  def dfs(target)
    return self if key == target
    left_result = left.dfs(target) if left
    return left_result if left_result && left_result.key == target
    return right.dfs(target) if right
  end
end
