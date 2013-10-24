class Vertex
  def initialize(key)
    @key = key
    @edges = edges
  end

end


class Edge
  attr_reader :weight, :v1, :v2
  def initialize(weight, v1, v2)
    @weight, @v1, @v2 = weight, v1, v1
  end
end
