require 'pry'
require './lib/input.rb'
class Board
  attr_accessor :spaces, :letter, :checker_hash

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


  def valid_column?(choice)
    to_be_tested = Input.new(choice)
    if @spaces[to_be_tested.translator][0] == "."
      true
    else
      false
    end
  end


  #vertical_checker, horizontal_checker and diagonal_checker look through the board on 3 axises for 4 in a row. if found, will return true, else will return false.
  #they accept no arguments, and will check the @spaces instance variable in its current state.


  def vertical_checker
    @spaces.each do |column|#iterates through all 7 columns
      3.times do |count|
        # binding.pry
        if ((column[count] != "." && column[count] == column[count+1]) && column[count] == column[count+2])&& column[count] == column[count+3]
          return true
        end
      end
    end
    return false
  end

  def column_to_row_translation
    output = []
    6.times do |row|
      accumulator = []
      @spaces.each do |column|
        accumulator << column[row]
      end
      # binding.pry
      output << accumulator
    end
    # binding.pry
    return output
  end

  def horizontal_checker
    to_check = column_to_row_translation
    to_check.each do |row|#iterates through all 6 rows
      4.times do |column| #checks for 4 in a row from 4 starting positions to cover entire row
        # binding.pry
        if ((row[column] != "." && row[column] == row[column+1]) && row[column] == row[column+2])&& row[column] == row[column+3]
          return true
        end
      end
    end
    return false
  end

  def diagonal_translator_1 #It's messy but IT WORKS!!! translates diagonally like ///
    output = []
    row = 3
    column = 0
    3.times do |count|
      row_counter = row + count
      column_counter = column
      accumulator = []
      loop do #each loop builds one of the first 3 diagonal arrays
        accumulator << @spaces[column_counter][row_counter]
        if row_counter == 0
          break
        end
        row_counter -= 1
        column_counter += 1
      end
      output << accumulator
    end
    row = 5
    column = 1
    3.times do |count|
      row_counter = row
      column_counter = column + count
      accumulator = []
      loop do
        accumulator << @spaces[column_counter][row_counter]
        if column_counter == 6
          break
        end
        row_counter -= 1
        column_counter += 1
      end
      output << accumulator
    end
    return output
  end

  def diagonal_translator_2 #translates diagonally like \\\
    output = []
    row = 3
    column = 6
    3.times do |count|
      row_counter = row + count
      column_counter = column
      accumulator = []
      loop do #each loop builds one of the first 3 diagonal arrays
        accumulator << @spaces[column_counter][row_counter]
        if row_counter == 0
          break
        end
        row_counter -= 1
        column_counter -= 1
      end
      output << accumulator
    end
    row = 5
    column = 5
    3.times do |count|
      row_counter = row
      column_counter = column - count
      accumulator = []
      loop do
        # binding.pry
        accumulator << @spaces[column_counter][row_counter]
        if column_counter == 0
          break
        end
        row_counter -= 1
        column_counter -= 1
      end
      output << accumulator
    end
    return output
  end

  def diagonal_checker
    to_check = [diagonal_translator_1, diagonal_translator_2]
    to_check.each do |board|

      board.each do |diagonal_array|
        accumulator = 1
        accessor = 1
        diagonal_array.each do |element|

          if element == diagonal_array[accessor] && element != "."
            accumulator += 1
            if accumulator == 4
              return true
            end
          else
            accumulator = 1
          end
          accessor += 1
        end
      end
    end
    return false
  end

  def is_winning_turn? (board)
    (board.vertical_checker || board.horizontal_checker) || board.diagonal_checker
  end

  def is_tie? (board)
    board.spaces.each do |column|
      if column[0] == "."
        return false
      end
    end
    return true
  end

  def vertical_three_checker
    @checker_hash = {:three_in_a_row => false, :column => nil}
    column_counter = -1
    @spaces.each do |column|#iterates through all 7 columns
      column_counter += 1
      3.times do |count|
        if ((column[count] == "." && column[count+1] == "O" && column[count+2] == "O" && column[count+3] == "O"))
          @checker_hash[:three_in_a_row] = true
          @checker_hash[:column] = column_counter
          return @checker_hash
        end
      end
    end
    return @checker_hash
  end

  def horizontal_three_checker
    @checker_hash = {:three_in_a_row => false, :column => nil}
    to_check = column_to_row_translation
    row_counter=0
    to_check.each do |row|#iterates through all 6 rows
      row_counter += 1
      4.times do |column| #checks for 4 in a row from 4 starting positions to cover entire row
        checking_array = []
        checking_array.push((row[column]), (row[column+1]), (row[column+2]), (row[column+3]))
        # if checking_array.count("O") == 3 && checking_array.include? "." && @spaces[column][checking_array.index(".") - 1 ] != "."
        if checking_array.count("O") == 3 && checking_array.include?(".") && @spaces[checking_array.index(".")+ column][row_counter] != "."
          @checker_hash[:three_in_a_row] = true
          @checker_hash[:column] = checking_array.index(".") + column
          return @checker_hash
        end
      end
    end
    return @checker_hash
  end
end
