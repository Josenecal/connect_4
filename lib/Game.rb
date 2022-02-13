require './lib/board.rb'
require './lib/computer.rb'
require './lib/input.rb'
require './lib/turn.rb'
require 'pry'


class Game

def initialize()
  @board = Board.new
  @computer = Computer.new
  @player = Player.new
end

end
