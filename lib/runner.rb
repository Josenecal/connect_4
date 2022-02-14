require 'pry'
require './lib/input.rb'
require './lib/board.rb'
require './lib/computer.rb'
require './lib/turn.rb'
require './lib/player.rb'

# selected = false
#  while selected == false do
#   puts "Welcome to CONNECT FOUR"
#   puts "Enter p to play. Enter q to quit."
#   play_or_exit = gets.upcase.chomp
# end

 class Game
   attr_accessor :player, :board, :letter, :computer

   def initialize ()
     @board = Board.new
     @player = Player.new
     @computer = Computer.new
   end
 end

  def run_game (game)

    while game.board.is_winning_turn?(game.board) == false && game.board.is_tie?(game.board) == false do
      winner = "human"
      game.board.print_board
      puts "Enter A, B, C, D, E, F or G to select a column"
      letter = game.player.gets_column
      while game.board.valid_column?(letter) == false
        puts "Column is full please choose another"
        game.board.print_board
        letter = game.player.gets_column
      end
      game.board.place_piece(letter, "X")
      game.board.print_board
      if game.board.is_winning_turn?(game.board) == false && game.board.is_tie?(game.board) == false
        letter = game.computer.gets_column(game.board)
        game.board.place_piece(letter, "O")
        winner = "computer"
      end
    end
    game.board.print_board



    #runs player turn, then computer turn
    #Check after each turn whether the game is over
      #If not, continue to next turn
      #if so, give appropriate end game message and call main_menu
  end


  def main_menu
    selected = false
    while selected == false do
      puts "Welcome to CONNECT FOUR"
      puts "Enter p to play. Enter q to quit."
      play_or_exit = gets.upcase.chomp
      if play_or_exit == "Q"
        abort("Good bye.")
      elsif play_or_exit == "P"
        selected = true
        game = Game.new
      else
        puts "Invalid selection!"
      end
    end
      run_game(game)


  end

  main_menu

  # if play_or_exit == "Q"
  #   abort("Good bye.")
  # elsif play_or_exit == "P"
  #   selected = true
  # else
  #   puts "Invalid selection!"
  # end
