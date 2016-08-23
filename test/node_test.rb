require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/node"

class NodeTest < Minitest::Test

  def setup
    @node1 = Node.new(50, "a medoicre movie")
    @node2 = Node.new(75, "a decent movie")
    @node3 = Node.new(25, "a bad movie")
    @node4 = Node.new(5, "a awful movie")
    @node5 = Node.new(1, "the worst movie")

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

  def test_it_knows_if_it_has_children
    refute @node1.left_child?
    refute @node1.right_child?
  end

  def test_it_can_store_and_pass_nodes
    assert_equal nil, @node1.left_child
    assert_equal nil, @node1.right_child
    @node1.decider(@node3)
    assert_instance_of Node, @node1.left_child
    @node1.decider(@node2)
    assert_instance_of Node, @node1.right_child
  end

  def test_it_returns_the_childs_rating_if_the_spot_is_filled
    @node1.decider(@node3)
    assert_instance_of Node, @node1.decider(@node4)
  end

  def test_printing_changes_printed_to_true
    refute @node1.printed?
    assert @node1.print
    assert @node1.printed?
  end

end
