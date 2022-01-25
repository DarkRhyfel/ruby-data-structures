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

  def insert(value, node = @root)
    return Node.new(value) if node.nil?

    if value < node.value
      node.left = insert(value, node.left)
    else
      node.right = insert(value, node.right)
    end

    node
  end

  def pretty_print(node = @root, prefix = '', is_left: true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", is_left: false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", is_left: true) if node.left
  end
end
