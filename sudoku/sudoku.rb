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
      if possibilites == 1

      end
    end
  end

  def possibilites
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

  def box_index(dash_index)
    case dash_index
    when 0,1,2,9,10,11,18,19,20
      0
    when 3,4,5,12,13,14,21,22,23
      1
    when 6,7,8,15,16,17,24,25,26
      2
    when 27,28,29,36,37,38,45,46,47
      3
    when 30,31,32,39,40,41,48,49,50
      4
    when 33,34,35,42,43,44,51,52,53
      5
    when 54,55,56,63,64,65,72,73,74
      6
    when 57,58,59,66,67,68,75,76,77
      7
    else
      8
    end
  end

 def box(dash_index)
    box_index = box_index(dash_index)
    @board_boxes = [[], [], [], [], [], [], [], [], []]
    @board_array.each_with_index do |number, index|
      if index/9 < 3
        if index%9 < 3
            @board_boxes[0] << number
        elsif 3 <= index%9 && index%9 < 6
            @board_boxes[1] << number
        else
            @board_boxes[2] << number
        end
      elsif 3 <= index/9 && index/9 < 6
        if index%9 < 3
          @board_boxes[3] << number
        elsif 3 <= index%9 && index%9 < 6
          @board_boxes[4] << number
        else
          @board_boxes[5] << number
        end
      else
        if index%9 < 3
          @board_boxes[6] << number
        elsif 3 <= index%9 && index%9 < 6
          @board_boxes[7] << number
        else
          @board_boxes[8] << number
        end
      end
    end
    @board_boxes[box_index]
end

  def display
    counter = 0
    [9,18,27,36,45,54,63,72].each_with_index do |number, index|
      adaptive_index = number + index
      @board_string.insert(adaptive_index, "\n")
    end
    @board_string.each_char {|i| print " " + i}
  end
end

# board_string = File.readlines('sudoku_puzzles.txt').first.chomp
board_string = "4-5269781682571493197834562826195347374682915951743628519326874248957136763418259"

game = Sudoku.new(board_string)
game.solve
game.display

