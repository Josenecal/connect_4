class Input

  attr_accessor :letter

  def initialize(letter)
    @letter = letter.upcase
  end

  def translator
    if letter == "A"
      return 0
    end

    if letter == "B"
      return 1
    end

    if letter == "C"
      return 2
    end

    if letter == "D"
      return 3
    end

    if letter == "E"
      return 4
    end

    if letter == "F"
      return 5
    end

    if letter == "G" 
      return 6
    end
  end
end
