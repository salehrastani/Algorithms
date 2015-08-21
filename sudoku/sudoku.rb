class Sudoku
  def initialize(board_string)
  end

  def solve
  end

  def board
  end

  # Returns a string representing the current state of the board
  def to_s
  end
end

board_string = File.readlines('sudoku_puzzles.txt').first.chomp

game = Sudoku.new(board_string)
game.solve
puts game
