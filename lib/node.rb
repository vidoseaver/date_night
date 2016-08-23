require "pry"

class Node

  attr_reader :rating,
              :name
              :printed
  attr_accessor :left_child,
                :right_child,
                :depth
                :print

  def initialize(rating,name)
    @rating = rating
    @name = name
    @left_child = nil
    @right_child = nil
    @depth = 0
    @printed = false
  end

  def decider(node)
    case
    when left_child? == false && node.rating < rating
      node.depth += 1
      @left_child = node
      node.depth
    when right_child? == false && node.rating > rating
      node.depth += 1
      @right_child = node
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
    if @left_child == nil
      false
    else
      true
    end
  end

  def right_child?
    if @right_child == nil
      false
    else
      true
    end
  end

  def print
    @printed = true
  end

  def printed?
    @printed
  end

end
