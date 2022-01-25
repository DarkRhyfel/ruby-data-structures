# frozen_string_literal: true

# Imports
require './BBST/classes/node'

# Tree class
class Tree
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
end
