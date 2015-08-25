class Sudoku
  def initialize(board_string)
    @board_string = board_string
    @board_array = @board_string.split("")
    @numbers = %w{1 2 3 4 5 6 7 8 9}
    # @pivot = 0
  end

  def solve
    @board_array.each_with_index do |number, index|
      if number == "-"
        row = self.row(index)
        column = self.column(index)
        box = self.box(index)
      end
    end
  end

  def board
  end

  def row(dash_index)
    row = []
    @board_array.each_with_index do |number, index|
      if index % 9 == dash_index
        row << number
      end
    end
    row
  end

  def column(dash_index)
    @board_rows = @board_array.each_slice(9).to_a
    column_index = dash_index/9
    @board_rows[column_index]
  end

#  box_1 = []
#  box_2 = []
#  box_3 = []
#  board_boxes = []
#  board_array.each_with_index do |number, index|
#      if index/9 < 3
#          if (index % 9) < 3
#             box_1 << number
#          elsif 3 <= index%9 && index%9 < 6
#             box_2 << number
#          else
#             box_3 << number
#          end

#      end
#  end
#  board_boxes <<box_1 << box_2 << box_3
  def box_index(dash_index)
    case dash_index
    when 0,1,2,9,10,11,18,19,20
      0
    when 3,4,5,12,13,15,21,22,23
      1
    else
      p 1
    end
  end

  def box(dash_index)
    box_index = box_index(dash_index)
    @board_boxes = []
    @board_array.each_with_index do |number, index|
      if index/9 < 3
        if index%9 < 3
          @board_boxes << number
        elsif 3 <= index%9 && index%9< 6
          @board_boxes << number
        else
          @board_boxes << number
        end
      end
      # if 3 <= index/9 < 6
      #   if 3<=index%9 <= 6
      # end
      # if
      #   6 <= index/9 < 9 &&  6<=index%9 < 9
      # end
    end
    p @board_boxes
  end

  # Returns a string representing the current state of the board
  def to_s
    # @board_string
  end
end

# board_string = File.readlines('sudoku_puzzles.txt').first.chomp
board_string = "4-5269781682571493197834562826195347374682915951743628519326874248957136763418259"

game = Sudoku.new(board_string)
game.solve
game
