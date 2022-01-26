# frozen_string_literal: true

# Imports
require './BBST/classes/tree'

tree = Tree.new(Array.new(15) { rand(1..100) })
tree.pretty_print
puts tree.balanced? ? "\nIt's balanced" : "\nIt's not balanced"
puts "\nLevel order"
p tree.level_order
puts "\nInorder"
p tree.inorder
puts "\nPreorder"
p tree.preorder
puts "\nPostorder"
p tree.postorder
puts "\nAdding numbers"
10.times { tree.insert(rand(100..1000)) }
tree.pretty_print
puts tree.balanced? ? "\nIt's balanced" : "\nIt's not balanced"
tree.rebalance
tree.pretty_print
puts tree.balanced? ? "\nIt's balanced" : "\nIt's not balanced"
puts "\nLevel order"
p tree.level_order
puts "\nInorder"
p tree.inorder
puts "\nPreorder"
p tree.preorder
puts "\nPostorder"
p tree.postorder
