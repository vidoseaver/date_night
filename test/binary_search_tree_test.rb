require "minitest/autorun"
require "minitest/pride"
require "./lib/binary_search_tree"

class BinarySearchTreeTest < Minitest::Test
  def setup
    @tree = BinarySearchTree.new
  end

  def test_it_exists
    assert_instance_of BinarySearchTree, @tree
  end

  def test_it_can_create_a_node
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_instance_of Node, @tree.root
  end

  def test_it_returns_the_nodes_level_with_insert
    assert_equal 0, @tree.insert(61, "Bill & Ted's Excellent Adventure")
  end

  def test_it_can_link_nodes
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, @tree.insert(75, "Jarhead")
  end

end
