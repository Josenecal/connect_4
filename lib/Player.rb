require "./lib/input.rb"
class Player

  def initialize()

  end

  def gets_column() #Gets a valid player choice and returns as column number
    valid_choices = ["a","b","c","d","e","f","g"]
    player_letter = gets.chomp.downcase
    # while player_letter.downcase != "\a..g\" #there's a way to express a-g with regular expressions
    while valid_choices.include?(player_letter) == false
      p "invalid column selection!"
      p "please enter a column a - g"
      player_letter = gets.chomp
    end
    player_choice = Input.new(player_letter)
    return player_choice.translator
  end

end
