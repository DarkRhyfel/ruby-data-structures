# frozen_string_literal: true

# References
require './LinkedList/classes/node'

# LinkedList class
class LinkedList
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
