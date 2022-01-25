# frozen_string_literal: true

# References
require './LinkedList/classes/node'

# LinkedList class
class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
      return
    end

    temp_node = @head
    temp_node = temp_node.next_node until temp_node.next_node.nil?

    temp_node.next_node = Node.new(value)
  end

  def prepend(value)
    if @head.nil?
      @head = Node.new(value)
      return
    end

    @head = Node.new(value, @head)
  end

  def size
    count = 0

    temp_node = @head
    until temp_node.nil?
      count += 1
      temp_node = temp_node.next_node
    end

    count
  end

  def tail
    return @head if @head.nil?

    temp_node = @head
    temp_node = temp_node.next_node until temp_node.next_node.nil?
    temp_node
  end

  def at(index)
    return @head if @head.nil?

    temp_node = @head
    temp_index = 0

    until temp_index == index || temp_node.nil?
      temp_index += 1
      temp_node = temp_node.next_node
    end

    temp_node
  end

  def pop
    return @head if @head.nil?

    previous_node = @head
    current_node = @head.next_node

    until current_node.next_node.nil?
      previous_node = current_node
      current_node = current_node.next_node
    end

    previous_node.next_node = nil
    current_node
  end

  def contains?(value)
    return false if @head.nil?

    temp_node = @head
    until temp_node.nil?
      return true if temp_node.value == value

      temp_node = temp_node.next_node
    end

    false
  end

  def to_s
    return 'nil' if @head.nil?

    list_string = ''
    temp_node = @head

    until temp_node.nil?
      list_string += "( #{temp_node.value} ) -> "
      temp_node = temp_node.next_node
    end

    "#{list_string} nil"
  end
end
