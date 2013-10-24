class TreeNode
  attr_reader :key, :left, :right
  def initialize(value)
    @value = value
  end

  def add_child(n)
    if n < value && !left
      @left = TreeNode.new(n)
    elsif n < value
      @left.add_child(n)
    elsif n >= value && !right
      @right = n
    else
      @right.add_child(n)
    end
  end
end
