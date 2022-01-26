# frozen_string_literal: true

# Node class
class Node
  include Comparable

  attr_accessor :value, :left, :right

  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def <=>(other)
    value <=> other.value
  end

  def child_count
    count = 0

    count += 1 unless left.nil?
    count += 1 unless right.nil?

    count
  end

  def children?
    !(left.nil? && right.nil?)
  end
end
