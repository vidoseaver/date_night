require "pry"
require "./lib/node"

class BinarySearchTree
  attr_reader :root

  def initialize
    @node_count = 0
    @root = 0
    @nodes = Hash.new
    @sorted = Array.new
  end

  def insert(rating,name)
    @node_count += 1
    if @node_count == 1
      @root =  Node.new(rating,name)
      @nodes[rating] = @root
      @root.depth
    else
      passer(rating,name) #method to pass root the new node
    end
  end

  def passer(rating,name)
    @nodes[rating] = Node.new(rating,name)
    node = @nodes[rating]
    case
    when @root.left_child== 0 && rating < @root.rating
      node.depth += 1
      @root.left_child = node
      return node.depth
    when @root.right_child == 0 && rating > @root.rating
      node.depth += 1
      @root.right_child = node
      return node.depth
    else
      setter(@root.rating,node)
    end
  end

  def setter(rating,node)
    decided     = @nodes[rating].decider(node)
    left_child  = @nodes[rating].left_child
    right_child = @nodes[rating].right_child
    return decided if left_child == node || right_child == node
    setter(decided.rating, node)
  end

  def include?(rating,node = @root)
    return false if node.nil? || node == 0
    return true if rating == node.rating
    if rating < node.rating
      include?(rating, node.left_child)
    else
      include?(rating, node.right_child)
    end
  end

  def depth_of(rating, node = @root)
    return node.depth if node.rating == rating
    if rating < node.rating
      depth_of(rating, node.left_child)
    else
      depth_of(rating, node.right_child)
    end
  end

  def min
    {"#{smallest.name}" => smallest.rating}
  end

  def smallest(node = @root)
    return node if node.left_child == nil
    smallest(node.left_child)
  end

  def max
    {"#{largest.name}" => largest.rating}
  end

  def largest(node = @root)
    return node if node.right_child == nil
    largest(node.right_child)
  end


  def sort(node = @root)
    return beautifier if @sorted.length == @nodes.length
    sort(node.left_child)if node.left_child?
    sort_colletor(node)
    beautifier
  end

  def sort_colletor(node)
    return beautifier if @sorted.length == @nodes.length
    @sorted << node
    node.print
    if node.right_child? && node.right_child.printed? == false
      sort(node.right_child)
    else
      sort_colletor(valid_parent_finder(node))
    end
  end

  def valid_parent_finder(node)
    return if node.depth == 0 && node.printed?
    return node if node.printed? == false
    valid_parent_finder(parent_finder(node))
  end

  def parent_finder(child_node, node = @root)
    return node if node.right_child == child_node || node.left_child == child_node
    if child_node.rating < node.rating
      parent_finder(child_node, node.left_child)
    else
      parent_finder(child_node, node.right_child)
    end
  end

  def beautifier
    @sorted.map do |node|
      {node.name => node.rating}
    end
  end

  def load(path)
    file = File.open(path)
    file.readlines.each do |line|
      split = line.split(",")
      insert(split.first,split.last.chomp)
    end
    @nodes.length
  end

end
