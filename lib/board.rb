require 'pry'
class Board
  attr_accessor :spaces


  def initialize ()
    #Represents 7 columns, each with 6 rows.
    #@space[0] to represent column A, @spaces [0][0] the top-left-most space.
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


def valid_column?
  @valid_choices = ["A","B","C","D","E","F","G","a","b","c","d","e","f","g"]
  if letter == "A" && test_board.spaces[0][0] == "." || letter == "a" && @test.spaces[0][0] == "."
    return true
  else
    return false
  end

  if letter == "B" && test_board.spaces[1][0] == "."  || letter == "b" && test_board.spaces[1][0] == "."
    return true
  else
    return false
  end

  if letter == "C" && test_board.spaces[2][0] == "." || letter == "c" && test_board.spaces[2][0] == "."
    return true
  else
    return false
  end

  if letter == "D" && test_board.spaces[3][0] == "." || letter == "d" && test_board.spaces[3][0] == "."
    return true
  else
    return false
  end

  if letter == "E" && test_board.spaces[4][0] == "." || letter == "e" && test_board.spaces[4][0] == "."
    return true
  else
    return false
  end

  if letter == "F" && test_board.spaces[5][0] == "." || letter == "f" && test_board.spaces[5][0] == "."
    return true
  else
    return false
  end

  if @valid_choices.include?(letter) == false
    return false
  end
end
end
