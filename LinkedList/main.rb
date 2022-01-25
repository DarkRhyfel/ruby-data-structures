# frozen_string_literal: true

# Imports
require './LinkedList/classes/linked_list'

list = LinkedList.new
puts list
puts "Current head: #{list.head}"
puts "Current tail: #{list.tail}"
puts "Current item at 1: #{list.at(1)}"
puts "List item count: #{list.size}"
list.append('test')
list.append('test2')
puts list
puts "Current head: #{list.head}"
puts "Current tail: #{list.tail}"
puts "Current item at 1: #{list.at(1)}"
puts "List item count: #{list.size}"
list.prepend('test3')
list.prepend('test4')
puts list
puts "Current head: #{list.head}"
puts "Current tail: #{list.tail}"
puts "Current item at 1: #{list.at(1)}"
puts "List item count: #{list.size}"
puts 'Popping an item'
puts "Popped #{list.pop}"
puts list
puts "Current tail: #{list.tail}"
puts "List item count: #{list.size}"
puts "List contains test? #{list.contains?('test')}"
puts "List contains test2? #{list.contains?('test2')}"
puts "Index of test3 #{list.find('test3')}"
puts "Index of test5 #{list.find('test5')}"
