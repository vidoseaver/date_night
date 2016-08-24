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
    place_and_respond_left(node, "create child")   if matching_left_child_empty?(node)
    add_to_right(node, "create child")  if matching_right_child_empty?(node)
    add_to_left(node)                   if matching_left_child_full?(node)
    add_to_right(node)                  if matching_right_child_full?(node)
  end

  def matching_left_child_empty?(node)
    left_child? == false && node.rating < rating
  end

  def matching_right_child_empty?(node)
    right_child? == false && node.rating > rating
  end

  def add_to_right(node, create_indicator = nil)
    node.depth += 1
    @right_child = node
    node.depth if create_indicator
  end

  def add_to_left(node, create_indicator = nil)
    node.depth += 1
    @left_child = node
    node.depth if create_indicator
  end

  def left_child?
    @left_child ? true : false
  end

  def right_child?
    @right_child ? true : false
  end

  def print
    @printed = true
  end

  def printed?
    @printed
  end

end
