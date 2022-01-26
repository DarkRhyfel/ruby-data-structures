# frozen_string_literal: true

# Imports
require './BBST/classes/node'

# Tree class
class Tree # rubocop:disable Metrics/ClassLength
  def initialize(array)
    @root = build_tree(array.uniq.sort)
  end

  def build_tree(array)
    case array.count
    when 0 then nil
    when 1 then Node.new(array[0])
    else
      mid = array.count / 2
      Node.new(array[mid], build_tree(array[0...mid]), build_tree(array[(mid + 1)..]))
    end
  end

  def insert(value)
    @root = insert_node(value, @root)
  end

  def delete(value)
    @root = delete_node(value, @root)
  end

  def find(value, root = @root)
    return nil if root.nil?

    if root.value == value
      root
    elsif value < root.value
      find(value, root.left)
    else
      find(value, root.right)
    end
  end

  def level_order(&block)
    return nil if @root.nil?

    traversal([@root].concat(level_order_traversal(@root)), &block)
  end

  def inorder(&block)
    return nil if @root.nil?

    traversal(inorder_traversal(@root), &block)
  end

  def preorder(&block)
    return nil if @root.nil?

    traversal(preorder_traversal(@root), &block)
  end

  def postorder(&block)
    return nil if @root.nil?

    traversal(postorder_traversal(@root), &block)
  end

  def height(node)
    return 0 if node.nil?

    count = node.children? ? 1 : 0
    count += [height(node.right), height(node.left)].max

    count
  end

  def depth(node, root = @root)
    return 0 if node.nil? || node == root

    count = 1
    count += node < root ? depth(node, root.left) : depth(node, root.right)

    count
  end

  def balanced?
    (height(@root.left) - height(@root.right)).abs <= 1
  end

  def rebalance
    @root = build_tree(inorder)
  end

  def pretty_print(node = @root, prefix = '', is_left: true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", is_left: false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", is_left: true) if node.left
  end

  private

  def insert_node(value, root)
    return Node.new(value) if root.nil?

    if value < root.value
      root.left = insert_node(value, root.left)
    else
      root.right = insert_node(value, root.right)
    end

    root
  end

  def delete_node(value, root)
    return root if root.nil?

    if root.value == value
      delete_from_current(root)
    else
      delete_from_branch(value, root)
    end
  end

  def delete_from_branch(value, root)
    if value < root.value
      root.left = delete_node(value, root.left)
      root
    elsif value > root.value
      root.right = delete_node(value, root.right)
      root
    end
  end

  def delete_from_current(root)
    case root.child_count
    when 0 then nil
    when 1 then root.left.nil? ? root.right : root.left
    else delete_two_children(root)
    end
  end

  def delete_two_children(root)
    succesor_parent, succesor = current_succesor(root)

    if succesor_parent != root
      succesor_parent.left = succesor.right
    else
      succesor_parent.right = succesor.right
    end

    root.value = succesor.value
    root
  end

  def current_succesor(root)
    succesor_parent = root
    succesor = root.right

    until succesor.left.nil?
      succesor_parent = succesor
      succesor = succesor.left
    end

    [succesor_parent, succesor]
  end

  def traversal(nodes, &block)
    if block_given?
      nodes.each(&block)
    else
      nodes.map(&:value)
    end
  end

  def level_order_traversal(root)
    return [] if root.nil?

    nodes = []
    nodes << root.left unless root.left.nil?
    nodes << root.right unless root.right.nil?

    nodes.concat(level_order_traversal(root.left))
    nodes.concat(level_order_traversal(root.right))

    nodes
  end

  def inorder_traversal(root)
    nodes = []

    nodes.concat(inorder_traversal(root.left)) unless root.left.nil?
    nodes << root
    nodes.concat(inorder_traversal(root.right)) unless root.right.nil?

    nodes
  end

  def preorder_traversal(root)
    nodes = []

    nodes << root
    nodes.concat(preorder_traversal(root.left)) unless root.left.nil?
    nodes.concat(preorder_traversal(root.right)) unless root.right.nil?

    nodes
  end

  def postorder_traversal(root)
    nodes = []

    nodes.concat(postorder_traversal(root.left)) unless root.left.nil?
    nodes.concat(postorder_traversal(root.right)) unless root.right.nil?
    nodes << root

    nodes
  end
end
