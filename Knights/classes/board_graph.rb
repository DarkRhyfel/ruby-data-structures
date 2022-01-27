# frozen_string_literal: true

# Imports
require './Knights/classes/tile'

# BoardGraph class: Defines the graph of moves and methods to interact with it
class BoardGraph
  def knight_moves(start, finish)
    build_path(breadth_traverse([Tile.new(start)], finish))
  end

  def show_result(path)
    puts "You reached the tile in #{path.count} move#{path.count == 1 ? '' : 's'}"
    result = ''
    path.each { |position| result += "#{position} -> " }
    puts result[0..-4]
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

  def breadth_traverse(queue, finish)
    finish_child = queue.find { |node| node.position == finish }
    return finish_child unless finish_child.nil?

    root = queue.shift
    root.children = generate_children(root, queue)
    root.children.each { |child| queue << child }

    breadth_traverse(queue, finish)
  end

  def build_path(finish_child)
    current_node = finish_child
    path = []

    until current_node.nil?
      path << current_node.position
      current_node = current_node.parent
    end

    path.reverse
  end
end
