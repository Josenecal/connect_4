require 'pry'
require 'rspec'
require 'lib/board.rb'
require 'lib/turn.rb'

RSpec.describe 'place_piece' do
  it 'Accepts a single argument representing a column, and adds a piece to the first availabel space of the given column' do
#{setup}, execution, test
    test_board = board.new
    test_board.spaces = [[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],["o", "x", "o", "x", "o", "x"], [".", "x", "o", "x", "o", "x"]]
    test_turn = Turn.new
    test_turn.place_piece("A")

    expect(test_board.spaces).to eq([[".", ".", ".", ".", ".", "x"],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],["o", "x", "o", "x", "o", "x"], [".", "x", "o", "x", "o", "x"]])
  end

  it 'adds to the first available space if columns already contain pieces' do
    test_board = board.new
    test_board.spaces = [[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],["o", "x", "o", "x", "o", "x"], [".", "x", "o", "x", "o", "x"]]
    test_turn = Turn.new
    test_turn.place_piece("G")

  expect(test_board.spaces).to eq([[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],["o", "x", "o", "x", "o", "x"], ["x", "x", "o", "x", "o", "x"]])
  end

  #Though about adding functionality to prevent a player from adding a piece to a column that is already full, but this isn't really a job for the place_piece method, this is for the column_full? method. They can interact in the runner. 
end
