# frozen_string_literal: true

# Tile class: represents a square on the board
class Tile
  attr_reader :position, :parent
  attr_accessor :children

  def initialize(position, parent = nil, children = nil)
    @position = position
    @parent = parent
    @children = children
  end
end
