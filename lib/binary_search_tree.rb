require "pry"
require "./lib/node"

class BinarySearchTree
  attr_reader :root

  def initialize
    @node_count = 0
    @root = 0
    @nodes = Hash.new
  end

  def insert(rating,name)
    @node_count += 1
    if @node_count == 1
      @root =  Node.new(rating,name)
      @nodes[rating] = @root
      0 #level #variable
    else
      passer(rating,name) #method to pass root the new node
      1 #level number variable
    end
  end

  def passer(rating,name)
    @nodes[rating] = Node.new(rating,name)
    case
    when @root.rating == 0 && rating < @root.rating
      @root.left_child = rating
    when @root.rating == 0 && rating > @root.rating
      @root.right_child = rating
    else
      # setter(@nodes[rating])
    end
  end



end
