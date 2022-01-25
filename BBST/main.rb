# frozen_string_literal: true

# Imports
require './BBST/classes/tree'

tree = Tree.new([7, 15, 6, 1, 4, 10, 9])
tree.pretty_print

tree.insert(35)
tree.insert(2)
tree.insert(21)
tree.insert(11)
tree.insert(8)
tree.pretty_print
