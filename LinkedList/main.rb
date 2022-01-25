# frozen_string_literal: true

# Imports
require './LinkedList/classes/linked_list'

list = LinkedList.new
puts list
list.append('test')
list.append('test2')
puts list
list.prepend('test3')
list.prepend('test4')
puts list
