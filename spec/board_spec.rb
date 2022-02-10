require 'rspec'
require './lib/board.rb'
require './lib/input.rb'


RSpec.describe 'Class exists' do
  xit 'creates a new instance of Board object' do
    test_var = Board.new()
    expect(test_var).to be_an_instance_of(Board)
  end
  describe 'place_piece' do
    xit 'Accepts a single argument representing a column, and adds a piece to the first availabel space of the given column' do
  #{setup}, execution, test
      test_board = Board.new
      test_board.spaces = [[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],["o", "x", "o", "x", "o", "x"], [".", "x", "o", "x", "o", "x"]]
      test_board.place_piece(0, "x")

      expect(test_board.spaces).to eq([[".", ".", ".", ".", ".", "x"],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],["o", "x", "o", "x", "o", "x"], [".", "x", "o", "x", "o", "x"]])
    end

    xit 'adds to the first available space if columns already contain pieces' do
      test_board = Board.new
      test_board.spaces = [[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],["o", "x", "o", "x", "o", "x"], [".", "x", "o", "x", "o", "x"]]
      test_board.place_piece(6, "x")

    expect(test_board.spaces).to eq([[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],["o", "x", "o", "x", "o", "x"], ["x", "x", "o", "x", "o", "x"]])
    end

    it 'accepts input A on an empty board' do
      test_board = Board.new
      test_board.spaces = [[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", "."]]
      choice = Input.new("A")
      expect(test_board.valid_column?).to eq true
    end





  end
end
