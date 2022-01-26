# frozen_string_literal: true

# Imports
require './Knights/classes/board_graph'

board = BoardGraph.new
board.knight_moves([0, 0], [1, 2])
