require './lib/board.rb'
# This file is meant to be a collection of test cases - boards with wins, boards without wins, stalemate scenarios, edge cases etc. It will not be used necessarily as written, but it meant as a repository of all test cases that we come up with, to be used as necessary in spec files.

#--INCOMPLETE CASES--

#with one full column and one nearly-full collumn
test_board.spaces = [[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],["o", "x", "o", "x", "o", "x"], [".", "x", "o", "x", "o", "x"]]

#with only one playable column
test_board.spaces = [["x", "x", "o", "x", "o", "x"],["x", "x", "o", "x", "o", "x"],[".", ".", ".", ".", ".", "."],["x", "x", "o", "x", "o", "x"],["x", "x", "o", "x", "o", "x"],["o", "x", "o", "x", "o", "x"], ["x", "x", "o", "x", "o", "x"]]

#near diagonal win
test_board.spaces = [[".", ".", ".", ".", "x", "x"],[".", ".", ".", ".", "o", "o"],[".", ".", "x", "o", "o", "x"],[".", ".", ".", "x", "o", "o"],[".", ".", ".", ".", "o", "o"],[".", ".", ".", ".", ".", "x"], [".", ".", ".", ".", ".", "."]]

#--WINNING CASES--

#X wins on horizontal (Impossible board)
test_board.spaces = [[".", ".", ".", ".", ".", "."],[".", ".", "x", ".", ".", "."],[".", ".", "x", ".", ".", "."],[".", ".", ".", "x", ".", "."],[".", ".", ".", "x", "x", "x"],["o", "x", "o", "x", "o", "x"], [".", "x", "o", "x", "o", "x"]]

#O wins on horizontal
test_board.spaces = [[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", "o", "x"],[".", ".", ".", ".", "o", "x"],["o", "x", "o", "x", "o", "x"], [".", "x", "o", "x", "o", "o"]]

#All diagonals are straights
[["x", "o", "x", "o", "x", "o"],["o", "x", "o", "x", "o", "x"],["x", "o", "x", "o", "x", "o"],["o", "x", "o", "x", "o", "x"],["x", "o", "x", "o", "x", "o"],["o", "x", "o", "x", "o", "x"], ["x", "o", "x", "o", "x", "o"]]

#Diagonal win
test_board.spaces = [[".", ".", ".", ".", "x", "x"],[".", ".", ".", ".", "o", "o"],[".", ".", "x", "o", "o", "x"],[".", ".", ".", "x", "o", "o"],[".", ".", ".", ".", "x", "o"],[".", ".", ".", ".", ".", "x"], [".", ".", ".", ".", ".", "."]]

#--EDGE CASES--

#empty board
test_board.spaces = [[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", "."]]
