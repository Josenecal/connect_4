require './lib/board.rb'
require './lib/computer.rb'
require './lib/input.rb'
require './lib/turn.rb'
require 'pry'


class Game
  attr_accessor :player, :board, :letter, :computer, :winner, :two_players

  def initialize ()
    @board = Board.new
    @player = Player.new
    @player2 = Player.new
    @computer = Computer.new
    @winner = true
    @two_players = false
    @history = {p1: 0, p2: 0, comp: 0, tie: 0}
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

  def player2_turn(game)
    letter = game.player.gets_column
    while game.board.valid_column?(letter) == false
      puts "Column is full please choose another"
      game.board.print_board
      letter = game.player.gets_column
    end
    game.board.place_piece(letter, "O")
    if game.board.is_winning_turn?(game.board) == true
      game.winner = false
    end
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
     if game.two_players == true
       puts "Player 1, enter A, B, C, D, E, F or G to select a column"
     else
       puts "Enter A, B, C, D, E, F or G to select a column"
     end
     player1_turn(game)
     game.board.print_board
      if game.board.is_winning_turn?(game.board) == false && game.board.is_tie?(game.board) == false
        if game.two_players
          game.board.print_board
          puts "Player 2, enter A, B, C, D, E, F or G to select a column"
          player2_turn(game)
        else
          computer_turn(game)
        end
     end
   end
   game.board.print_board
   if game.board.is_tie?(game.board)
     puts "It's a tie"
     winner = :tie
   elsif game.winner == true
     puts "Player 1 wins!!!"
     winner = :p1
   elsif game.two_players == false
     puts "You have been bested by a machine, feel bad."
     winner = :comp
   else
     puts "Player 2 wins!!!"
     winner = :p2
   end
   main_menu(winner)

   #runs player turn, then computer turn
   #Check after each turn whether the game is over
     #If not, continue to next turn
     #if so, give appropriate end game message and call main_menu
 end


 def main_menu(winner=nil)
   if winner
     @history[winner] += 1
   end
   selected = false
   while selected == false do
     puts "Welcome to CONNECT FOUR"
     puts "Enter p to play, q to quit, or s to see everyone's score."
     play_or_exit = gets.upcase.chomp
     if play_or_exit == "Q"
       abort("Good bye.")
     elsif play_or_exit == "P"
       selected = true
       game = Game.new
       puts "How many humans are playing, 1 or 2?"
       two_player_switch = gets.chomp
       if two_player_switch == "2"
         game.two_players = true
       end
     elsif play_or_exit == "S"
       puts "Player ......................... score"
       puts "Player 1 .......................   #{@history[:p1]}"
       puts "Player 2 .......................   #{@history[:p2]}"
       puts "Computer .......................   #{@history[:comp]}"
       puts "#{@history[:tie]} games ended in a draw! "
     else
       puts "Invalid selection!"
     end
   end
     run_game(game)


 end
end
