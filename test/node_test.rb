require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/node"

class NodeTest < Minitest::Test

  def setup
    @node_1 = Node.new(50, "a medoicre movie")
    @node_2 = Node.new(75, "a decent movie")
    @node_3 = Node.new(25, "a bad movie")
    @node_4 = Node.new(5, "a awful movie")
    @node_5 = Node.new(1, "the worst movie")
  end

  def test_it_exists
    assert_instance_of Node, @node_1
  end

  def test_the_node_has_a_rating
    assert 50, @node_1.rating
  end

  def test_left_child_empty_returns_correctly
   @node_1.node = @node_3
   assert @node_1.left_child_empty?
   @node_1.decider(@node_3)
   refute @node_1.left_child_empty?
  end

  def test_right_child_empty_returns_correctly
   @node_1.node = @node_2
   assert @node_1.right_child_empty?
   @node_1.decider(@node_2)
   refute @node_1.right_child_empty?
  end

  def test_left_child_filled_returns_correctly
    @node_1.node = @node_3
    refute @node_1.left_child_filled?
    @node_1.decider(@node_3)
    assert @node_1.left_child_filled?
  end

  def test_right_child_filled_returns_correctly
    @node_1.node = @node_2
    refute @node_1.right_child_filled?
    @node_1.decider(@node_2)
    assert @node_1.right_child_filled?
  end

  def test_the_node_has_a_name
    assert 50, @node_1.name
  end

  def test_it_knows_if_it_has_children
    refute @node_1.left_child?
    refute @node_1.right_child?
  end


  def test_it_can_store_and_pass_nodes
    assert_equal nil, @node_1.left_child
    assert_equal nil, @node_1.right_child
    @node_1.decider(@node_3)
    assert_instance_of Node, @node_1.left_child
    @node_1.decider(@node_2)
    assert_instance_of Node, @node_1.right_child
  end

  def test_it_returns_the_childs_depth_if_the_spot_gets_filled
    @node_1.decider(@node_3)
    assert_equal 1, @node_1.decider(@node_4).depth
  end



  def test_reset_print_sets_print_false
    refute @node_1.printed?
    assert @node_1.print
    assert @node_1.printed?
    @node_1.reset_print
    refute @node_1.printed?
  end


end
