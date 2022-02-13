require 'pry'
require './lib/input.rb'
require './lib/board.rb'
require './lib/computer.rb'

# selected = false
#  while selected == false do
#   puts "Welcome to CONNECT FOUR"
#   puts "Enter p to play. Enter q to quit."
#   play_or_exit = gets.upcase.chomp
# end
#Any methods to write
  def start_game
    #starts the game by instantiating a Game object
    board = Board.new
  end

  def run_game (game)
    print_board(board)
    puts "Enter A, B, C, D, E, F or G to select a column"
    player.gets_column
    while board.valid_column?(letter) == false
      puts "Column is full please choose another"
      player.gets_column
    end
    board.place_piece(letter, "X")



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
      else
        puts "Invalid selection!"
      end
    end
    start_game
  end

  main_menu

  # if play_or_exit == "Q"
  #   abort("Good bye.")
  # elsif play_or_exit == "P"
  #   selected = true
  # else
  #   puts "Invalid selection!"
  # end
