require './lib/board.rb'
require './lib/computer.rb'
require './lib/input.rb'
require './lib/turn.rb'
require 'pry'


class Game
  attr_accessor :player, :board, :letter, :computer, :winner

  def initialize ()
    @board = Board.new
    @player = Player.new
    @computer = Computer.new
    @winner = true
  end

  def player1_turn(game)
    letter = game.player.gets_column
    while game.board.valid_column?(letter) == false
      puts "Column is full please choose another"
      game.board.print_board
      letter = game.player.gets_column
    end
    game.board.place_piece(letter, "X")
  end

  def computer_turn(game)
    if game.board.vertical_three_checker[:three_in_a_row] == true
      letter = game.board.vertical_three_checker[:column]
      game.board.place_piece(letter, "O")
      game.winner = false
    elsif game.board.horizontal_three_checker[:three_in_a_row] == true
      letter = game.board.horizontal_three_checker[:column]
      game.board.place_piece(letter, "O")
      game.winner = false
    else
      letter = game.computer.gets_column(game.board)
      game.board.place_piece(letter, "O")
      # game.winner = false
    end
  end

 def run_game (game)

   while game.board.is_winning_turn?(game.board) == false && game.board.is_tie?(game.board) == false do
     game.board.print_board
     puts "Enter A, B, C, D, E, F or G to select a column"
     player1_turn(game)
     game.board.print_board
      if game.board.is_winning_turn?(game.board) == false && game.board.is_tie?(game.board) == false
        computer_turn(game)
     end
   end
   game.board.print_board
   if game.board.is_tie?(game.board)
     puts "It's a tie"
   elsif game.winner == true
     puts "Congratulations you win!!!"
   else
     puts "You have been bested by a machine, feel bad."
   end
   main_menu

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
end
