# frozen_string_literal: true

# Imports
require './LinkedList/classes/linked_list'

list = LinkedList.new
puts list
puts "Current head: #{list.head}"
puts "Current tail: #{list.tail}"
puts "List item count: #{list.size}"
list.append('test')
list.append('test2')
puts list
puts "Current head: #{list.head}"
puts "Current tail: #{list.tail}"
puts "List item count: #{list.size}"
list.prepend('test3')
list.prepend('test4')
puts list
puts "Current head: #{list.head}"
puts "Current tail: #{list.tail}"
puts "List item count: #{list.size}"
