# frozen_string_literal: true

# Imports
require './Knights/classes/tile'

# BoardGraph class: Defines the graph of moves and methods to interact with it
class BoardGraph
  def knight_moves(start, finish)
    root = Tile.new(start)
    root.children = generate_children(root, [])

    p root.children
  end

  private

  def generate_children(root, queue)
    possible_moves(root, root.position[0], root.position[1])
      .filter { |move| !queue.include?(move) }
  end

  def possible_moves(root, row, column)
    moves = move(row, column, 1, 2).concat(move(row, column, 2, 1))

    moves.map { |move| Tile.new(move, root, nil) }
  end

  def move(row, column, row_shift, column_shift)
    row_move = [row - row_shift, row + row_shift]
    column_move = [column - column_shift, column + column_shift]

    row_move.product(column_move).filter { |move| move.all? { |position| position.between?(0, 7) } }
  end
end
