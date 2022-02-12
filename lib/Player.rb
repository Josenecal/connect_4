require "./lib/input.rb"
class Player

  def initialize()
    @argument = argument
  end

  def gets_column()
    valid_choices = [a,b,c,d,e,f,g]
    player_letter = gets.chomp
    # while player_letter.downcase != "\a..g\" #there's a way to express a-g with regular expressions
    while valid_choices.exclude? player_letter
      p "invalid column selection!"
      p "please enter a column a - g"
      player_letter = gets.chomp
    end
    player_choice = Input.new(player_letter)
    return player_choice.translator
  end

end
