require "minitest/autorun"
require "minitest/pride"
require "./lib/binary_search_tree"
require "./lib/node"

class BinarySearchTreeTest < Minitest::Test

  def setup
    @tree = BinarySearchTree.new
    @tree2 = BinarySearchTree.new

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
    # hash = Hash.new
    # hash["Sharknado 3"] = 92
    expected = {"Sharknado 3" => 92}
    assert_equal expected, @tree.max
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

  def test_print_resetter
    @tree.load("movies.txt")
    refute @tree.nodes.values.first.printed?
    @tree.print_resetter
    refute @tree.nodes.values.first.printed?
  end

  def test_it_find_all_children
    @tree.load("movies.txt")
  end

  def test_it_returns_array_of_children_by_node
    @tree.load("movies.txt")

    assert_equal 99, @tree.find_all_children(@tree.root).length
    # @tree.print_resetter
    assert_equal 70, @tree.find_all_children(@tree.root.left_child).length
  end

  def test_find_all_by_depth
    @tree.load("movies.txt")

    assert_instance_of Node, @tree.find_all_by_depth(0).first

    assert_instance_of Node, @tree.find_all_by_depth(1).first
    assert_instance_of Node, @tree.find_all_by_depth(1).last
    assert_equal 2, @tree.find_all_by_depth(1).length
  end

  def test_it_returns_the_health_according_spec

    @tree.insert(98, "Animals United")
    @tree.insert(58, "Armageddon")
    @tree.insert(36, "Bill & Ted's Bogus Journey")
    @tree.insert(93, "Bill & Ted's Excellent Adventure")
    @tree.insert(86, "Charlie's Angels")
    @tree.insert(38, "Charlie's Country")
    @tree.insert(69, "Collateral Damage")

    assert_equal [[98, 7, 100]],             @tree.health(0)
    assert_equal [[58, 6, 85]],              @tree.health(1)
    assert_equal [[36, 2, 28], [93, 3, 42]], @tree.health(2)
  end

  def test_all_the_children_it_has_returns_true_correctly
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    # @tree.insert(51, "depth 2 right child")

    @tree.root.left_child.print
    @tree.root.right_child.print
    node = @tree.root
    assert @tree.all_the_children_it_has_are_printed?(node)
    @tree.print_resetter
    refute @tree.all_the_children_it_has_are_printed?(node)
    @tree.root.left_child.left_child.print
    node = @tree.root.left_child
    assert @tree.all_the_children_it_has_are_printed?(node)
    @tree.print_resetter
    refute @tree.all_the_children_it_has_are_printed?(node)
  end
end
