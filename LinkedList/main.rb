# frozen_string_literal: true

# Imports
require './LinkedList/classes/linked_list'

puts "Creating list\n\n"
list = LinkedList.new
puts list
puts "Current head: #{list.head}"
puts "Current tail: #{list.tail}"
puts "Current item at 1: #{list.at(1)}"
puts "List item count: #{list.size}"

puts "\nAppending items\n\n"
list.append('test')
list.append('test2')
puts list
puts "Current head: #{list.head}"
puts "Current tail: #{list.tail}"
puts "Current item at 1: #{list.at(1)}"
puts "List item count: #{list.size}"

puts "\nPrepending items\n\n"
list.prepend('test3')
list.prepend('test4')
puts list
puts "Current head: #{list.head}"
puts "Current tail: #{list.tail}"
puts "Current item at 1: #{list.at(1)}"
puts "List item count: #{list.size}"

puts "\nPopping an item\n\n"
puts "Popped #{list.pop}"
puts list
puts "Current tail: #{list.tail}"
puts "List item count: #{list.size}"

puts "\nChecking items in list\n\n"
puts "List contains test? #{list.contains?('test')}"
puts "List contains test2? #{list.contains?('test2')}"

puts "\nFinding indices of items\n\n"
puts "Index of test3 #{list.find('test3')}"
puts "Index of test5 #{list.find('test5')}"

puts "\nInserting at indices\n\n"
list.insert_at('test2', 2)
puts list
puts "List item count: #{list.size}"
list.insert_at('test10', 10)
puts list
puts "List item count: #{list.size}"
list.insert_at('test5', 0)
puts list
puts "List item count: #{list.size}"

puts "\nRemoving at indices\n\n"
list.remove_at(2)
puts list
puts "List item count: #{list.size}"
list.remove_at(10)
puts list
puts "List item count: #{list.size}"
list.remove_at(0)
puts list
puts "List item count: #{list.size}"
