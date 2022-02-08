require 'rspec'
require './lib/board.rb'

RSpec.describe 'Class exists' do
  it 'creates a new instance of Board object' do
    test_var = Board.new()
    expect(test_var).to be_an_instance_of(Board)
  end
  describe 'place_piece' do
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
  end
end
