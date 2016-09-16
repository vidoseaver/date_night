require "pry"

class Node

  attr_reader   :rating,
                :name,
                :print

  attr_accessor :left_child,
                :right_child,
                :depth,
                :node


  def initialize(rating,name)
    @rating = rating
    @name = name
    @left_child = nil
    @right_child = nil
    @depth = 0
    @printed = false
  end

  def decider(node)
    @node = node
    return place_child("left")   if left_child_empty?
    return place_child("right")  if right_child_empty?
    return return_child("left")  if left_child_filled?
    return return_child("right") if right_child_filled?
  end

  def left_child_empty?
    @node.rating < rating   && left_child? == false
  end

  def right_child_empty?
    @node.rating > rating && right_child? == false
  end

  def left_child_filled?
    @node.rating < rating && left_child?
  end

  def right_child_filled?
    @node.rating > rating && right_child?
  end

  def place_child(direction)
    if direction == "left"
      @node.depth += 1
      @left_child = @node
      @node.depth
    else
      @node.depth += 1
      @right_child = @node
      @node.depth
    end
  end

  def return_child(direction)
    if direction == "left"
      @node.depth += 1
      @left_child
    else
      @node.depth += 1
      @right_child
    end
  end

  def left_child?
    #@left_child ? true : false
    !!@left_child
  end

  def right_child?
    @right_child ? true : false
  end

  def print
    @printed = true
  end

  def reset_print
    @printed = false
  end

  def printed?
    @printed
  end
end
