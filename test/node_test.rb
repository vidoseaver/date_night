require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/node"

class NodeTest < Minitest::Test

  def setup
    @node1 = Node.new(50, "a medoicre movie")
    @node2 = Node.new(75, "a decent movie")
    @node3 = Node.new 25, "a bad movie"

  end

  def test_it_exists
    assert_instance_of Node, @node1
  end

  def test_the_node_has_a_rating
    assert 50, @node1.rating
  end

  def test_the_node_has_a_name
    assert 50, @node1.name
  end

  def test_it_has_child_spots
    skip
    assert_equal "empty", @node1.left_child
  end

  def test_it_knows_if_it_has_children
    refute @node1.left_child?
    refute @node1.right_child?
  end

  def test_it_can_store_and_pass_nodes
    assert_equal 0, @node1.left_child
    assert_equal 0 , @node1.right_child
    @node1.decider(@node3)
    assert_equal 25, @node1.left_child
    @node1.decider(@node2)
    assert_equal 75, @node1.right_child
  end

end
