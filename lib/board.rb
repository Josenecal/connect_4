class Board

def initialize ()
  #Represents 7 columns, each with 6 rows.
  #@space[0] to represent column A, @spaces [0[0]] the top-left-most space.
@spaces = [[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", "."]]
end

def print_board
 puts "ABCDEFG"
row = 0
6.times do
  @spaces.each do |column|
   print column[row]
 end
 row += 1
 puts "\n"
end

end
end

test = Board.new
test.print_board
