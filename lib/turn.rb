require 'pry'
require "./lib/board.rb"
require './lib/input.rb'

class Turn
  attr_reader :letter
  def initialize()
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

end
    # if spaces[0..6][0] != "."
    #   return true
    # else
    #   return false
    # end
