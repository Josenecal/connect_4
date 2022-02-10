class Input

  attr_reader :letter

  def initialize(letter)
    @letter = letter
  end

  def translator
    if letter == "A" || letter == "a"
      return 0
    end

    if letter == "B" || letter == "b"
      return 1
    end

    if letter == "C" || letter == "c"
      return 2
    end

    if letter == "D" || letter == "d"
      return 3
    end

    if letter == "E" || letter == "e"
      return 4
    end

    if letter == "F" || letter == "f"
      return 5
    end

    if letter == "G" || letter == "g"
      return 6
    end
  end
end
