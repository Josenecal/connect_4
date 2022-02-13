require 'pry'
require './lib/input.rb'
require './lib/board.rb'
require './lib/computer.rb'
require './lib/turn.rb'

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

test_board = Board.new
computer = Computer.new
turn = Turn.new
choice = Input.new

while turn.is_tie?(test_board) == false && turn.is_winning_turn?.test_board == false
  test_board.print_board
  choice = gets.chomp


end
