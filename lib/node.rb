require "pry"

class Node

  attr_reader :rating,
              :name

  attr_accessor :left_child,
                :right_child,
                :depth

  def initialize(rating,name)
    @rating = rating
    @name = name
    @left_child = 0
    @right_child = 0
    @depth = 0
  end

  def decider(node)
    case
    when left_child? == false && node.rating < rating
      node.depth += 1
      @left_child = node.rating
      node.depth
    when right_child? == false && node.rating > rating
      node.depth += 1
      @right_child = node.rating
      node.depth
    when node.rating < rating
      node.depth += 1
      @left_child
    when node.rating > rating
      node.depth += 1
      @right_child
    end
  end


  def left_child?
    if @left_child == 0
      false
    else
      true
    end
  end

  def right_child?
    if @right_child == 0
      false
    else
      true
    end
  end

end
