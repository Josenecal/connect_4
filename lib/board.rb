require 'pry'
class Board
  attr_accessor :spaces

  def initialize ()
    #Represents 7 columns, each with 6 rows.
    #@space[0] to represent column A, @spaces [0[0]] the top-left-most space.
    #We'll fill this with x's to represent humnan moves, o's to represent the computer.
    @spaces = [[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", "."]]
  end

  def print_board
    puts "ABCDEFG"
    row = 0
    6.times do
      @spaces.each do |column|
        print column[row]
      end
    row += 1
    puts "\n"
    end
  end

  def place_piece(column, mark) #expects column letter, x or o
    counter = 5
    while counter >= 0 do
      if @spaces[column][counter]== "."
        @spaces[column][counter] = mark
        return true
      end
      counter -= 1
    end
    return false
  end
end

test = Board.new
test.print_board
