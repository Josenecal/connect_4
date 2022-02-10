require 'pry'
require "lib/board.rb"

class Turn
  attr_reader :letter
  def initialize()

  end

  def valid_column?
    @valid_choices = ["A","B","C","D","E","F","G","a","b","c","d","e","f","g"]
    @letter = gets
    @letter = @letter.chomp
    @final_choice = false
    @row = 5


    while @final_choice == false
      while @valid_choices.include?(@letter) == false
        puts "Invalid choice. Please select a vailid column to place your piece "
        @letter = gets
        @letter = @letter.chomp
      end
      if @letter == "A" || @letter == "a"
        if [0[@row]] == "."
          [0[@row]] = "X"
          @final_choice = true
        elsif @row == 0 && [0[0]] != "."
          @valid_choices.delete("A")
          @valid_choices.delete("a")
          @letter = "restart"
        else
          @row -= 1
        end
      end
    end
  end
end
test = Turn.new
test.valid_column?
