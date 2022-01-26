# frozen_string_literal: true

# Imports
require './BBST/classes/tree'

tree = Tree.new([7, 15, 6, 1, 4, 10, 9])

tree.insert(35)
tree.insert(40)
tree.insert(53)
tree.insert(2)
tree.insert(21)
tree.insert(11)
tree.insert(8)

tree.delete(21)
tree.delete(1)
tree.delete(9)
tree.delete(10)
tree.pretty_print

p tree.find(21)
p tree.find(6)

p tree.level_order
# tree.level_order { |node| puts "Level entry: #{node.value}"}

p tree.inorder
# tree.inorder { |node| puts "Inorder entry: #{node.value}" }

p tree.preorder
# tree.preorder { |node| puts "Preorder entry: #{node.value}" }

p tree.postorder
# tree.postorder { |node| puts "Postorder entry: #{node.value}" }

puts "Height of root #{tree.height(tree.find(7))}"
puts "Height of 11 #{tree.height(tree.find(11))}"
puts "Height of 15 #{tree.height(tree.find(15))}"
puts "Height of 35 #{tree.height(tree.find(35))}"

puts "Depth of root #{tree.depth(tree.find(7))}"
puts "Depth of 11 #{tree.depth(tree.find(11))}"
puts "Depth of 15 #{tree.depth(tree.find(15))}"
puts "Depth of 35 #{tree.depth(tree.find(35))}"

puts tree.balanced? ? "It's balanced" : "It's not balanced"
tree.rebalance
tree.pretty_print
