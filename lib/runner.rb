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
  end

  main_menu

  # if play_or_exit == "Q"
  #   abort("Good bye.")
  # elsif play_or_exit == "P"
  #   selected = true
  # else
  #   puts "Invalid selection!"
  # end
