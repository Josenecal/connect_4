require './lib/board.rb'
require './lib/input.rb'
require 'pry'


class Computer
  attr_accessor :number, :choice
  def initialize

  end

  def computer_choice(test_board)
    zero  = Input.new(0)
    one   = Input.new(1)
    two   = Input.new(2)
    three = Input.new(3)
    four  = Input.new(4)
    five  = Input.new(5)
    six   = Input.new(6)
    computer_choices = [zero,one,two,three,four,five,six]
    random_choices = computer_choices.shuffle
    random_choices.find do |number|
      if test_board.valid_column?(number) == true
        return number.letter
      end
    end
  end
end
