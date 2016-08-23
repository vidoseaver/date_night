require "minitest/autorun"
require "minitest/pride"
require "./lib/binary_search_tree"
require "./lib/node"

class BinarySearchTreeTest < Minitest::Test

  def setup
    @tree = BinarySearchTree.new




    @node1 = Node.new(50, "a medoicre movie")
    @node2 = Node.new(75, "a decent movie")
    @node3 = Node.new(25, "a bad movie")
    @node4 = Node.new(5, "a awful movie")
    @node5 = Node.new(1, "the worst movie")
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

  def test_setter_allows_it_to_place_multiple_layers_an_returns_the_level
    @tree.insert(50, "a medoicre movie")
    @tree.insert(25, "a bad movie")
    assert_equal 2, @tree.insert(5, "a awful movie")
  end

  def test_it_counts_like_spec
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    assert_equal 2, @tree.insert(50, "Hannibal Buress: Animal Furnace")
  end

  def test_include?
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert @tree.include?(16)
    refute @tree.include?(72)
  end

  def test_it_can_tell_you_the_depth
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 1,  @tree.depth_of(92)
    assert_equal 2 , @tree.depth_of(50)
  end

  def test_it_knows_the_max
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")
    hash = Hash.new
    hash["Sharknado 3"] = 92
    assert_equal hash, @tree.max
  end

  def test_it_knows_the_min
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")
    hash = Hash.new
    hash["Johnny English"] = 16

    assert_equal hash, @tree.min
  end

  def test_largest

    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    node = Node.new(16, "Johnny English")

    assert_equal "Sharknado 3", @tree.largest.name
  end

  def test_it_can_sort_the_nodes_by_rating
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")

    assert_equal [{"Johnny English"=>16}, {"Hannibal Buress: Animal Furnace"=>50}, {"Bill & Ted's Excellent Adventure"=>61}, {"Sharknado 3"=>92}], @tree.sort
  end

  def test_parent_finder

    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    node = Node.new(16, "Johnny English")

    assert_equal "Hannibal Buress: Animal Furnace", @tree.parent_finder(@tree.smallest).name
    assert_equal "Bill & Ted's Excellent Adventure", @tree.parent_finder(@tree.largest).name

  end

  def test_it_can_open_a_file
    assert_equal 99, @tree.load("movies.txt")
  end


end
