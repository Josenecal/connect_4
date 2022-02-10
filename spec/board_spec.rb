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
      test_board = Board.new
      test_board.spaces = [[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],["o", "x", "o", "x", "o", "x"], [".", "x", "o", "x", "o", "x"]]
      test_board.place_piece(0, "x")

      expect(test_board.spaces).to eq([[".", ".", ".", ".", ".", "x"],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],["o", "x", "o", "x", "o", "x"], [".", "x", "o", "x", "o", "x"]])
    end

    it 'adds to the first available space if columns already contain pieces' do
      test_board = Board.new
      test_board.spaces = [[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],["o", "x", "o", "x", "o", "x"], [".", "x", "o", "x", "o", "x"]]
      test_board.place_piece(6, "x")

    expect(test_board.spaces).to eq([[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],["o", "x", "o", "x", "o", "x"], ["x", "x", "o", "x", "o", "x"]])
    end
  end

  xit 'is A valid on an empty board' do

    letter = "A"
    Board.new
    test_board = Board.new
    expect(valid_column?).to eq(true)
  end

  xit 'is A valid on a full column' do

    letter = "a"
    test_board = Board.new
    test_board.spaces.replace [["X", "O", "X", "O", "X", "O"],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", "."]]
    expect(valid_column?).to eq(false)
  end

  xit 'is X a valid choice' do

    letter = "x"
    test_board = Board.new
    expect(valid_column?).to eq(false)
  end

  context 'vertical_checker' do
    it "detects 4 in a row vertically" do
      test_board = Board.new
      test_board.spaces = [[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", "x", "x", "x", "x"],["o", "x", "o", "x", "o", "x"], [".", "x", "o", "x", "o", "x"]]
      expect(test_board.vertical_checker).to eq (true)
      test_board.spaces = [[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],["x", "x", "x", "x", "o", "o"],["o", "x", "o", "x", "o", "x"], [".", "x", "o", "x", "o", "x"]]
      expect(test_board.vertical_checker).to eq (true)
      test_board.spaces = [[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],["o", "x", "o", "x", "o", "x"], [".", "x", "o", "x", "o", "x"]]
      expect(test_board.vertical_checker).to eq(false)
    end
  end

  context 'horizontal_checker' do
    it "detects 4 in a row horizontally" do
      test_board = Board.new
      test_board.spaces = [[".", ".", ".", ".", ".", "."],[".", ".", "x", ".", ".", "."],[".", ".", "x", ".", ".", "."],[".", ".", ".", "x", ".", "."],[".", ".", ".", "x", "x", "x"],["o", "x", "o", "x", "o", "x"], [".", "x", "o", "x", "o", "x"]]
      expect(test_board.horizontal_checker).to eq (true)
      test_board.spaces = [[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", "o", "x"],[".", ".", ".", ".", "o", "x"],["o", "x", "o", "x", "o", "x"], [".", "x", "o", "x", "o", "o"]]
      expect(test_board.horizontal_checker).to eq (true)
      test_board.spaces = [[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],["o", "x", "o", "x", "o", "x"], [".", "x", "o", "x", "o", "x"]]
      expect(test_board.horizontal_checker).to eq(false)
    end
  end

  context 'column_to_row translation' do
    it 'translates from 7 arrays of 6 dots to 6 arrays of 7 dots' do
      test_board = Board.new
      test_board.spaces = [[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", "."]]
      expect(test_board.column_to_row_translation).to eq([[".", ".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", ".", "."]])

      test_board.spaces = [["x", ".", ".", ".", ".", "."],["x", ".", ".", ".", ".", "."],["x", ".", ".", ".", ".", "."],["x", ".", ".", ".", ".", "."],["x", ".", ".", ".", ".", "."],["x", ".", ".", ".", ".", "."], ["x", ".", ".", ".", ".", "."]]
      expect(test_board.column_to_row_translation).to eq([["x", "x", "x", "x", "x", "x", "x",],[".", ".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", ".", "."]])
    end
  end

  context "diagonal translator 1 /// " do
    it "converts all 45˚ diagonals longer than 4 spaces to arrays" do
      test_board = Board.new
      test_board.spaces = [["x", "o", "x", "o", "x", "o"],["o", "x", "o", "x", "o", "x"],["x", "o", "x", "o", "x", "o"],["o", "x", "o", "x", "o", "x"],["x", "o", "x", "o", "x", "o"],["o", "x", "o", "x", "o", "x"], ["x", "o", "x", "o", "x", "o"]]
      expect(test_board.diagonal_translator_1).to eq([["o", "o", "o", "o"], ["x", "x", "x", "x", "x"], ["o", "o", "o", "o", "o", "o"], ["x", "x", "x", "x", "x", "x"], ["o", "o", "o", "o", "o"], ["x", "x", "x", "x"]])
    end
  end

  context 'diagonal translator 2 \\\ ' do
    it 'converts all 45˚ diagonals longer than 4 spaces to arrays' do
      test_board = Board.new
      test_board.spaces = [["x", "o", "x", "o", "x", "o"],["o", "x", "o", "x", "o", "x"],["x", "o", "x", "o", "x", "o"],["o", "x", "o", "x", "o", "x"],["x", "o", "x", "o", "x", "o"],["o", "x", "o", "x", "o", "x"], ["x", "o", "x", "o", "x", "o"]]
      expect(test_board.diagonal_translator_2).to eq([["o", "o", "o", "o"], ["x", "x", "x", "x", "x"], ["o", "o", "o", "o", "o", "o"], ["x", "x", "x", "x", "x", "x"], ["o", "o", "o", "o", "o"], ["x", "x", "x", "x"]])
    end
  end

  context 'diagonal_checker' do
    it "detects 4 in a row diagonally" do
      test_board = Board.new
      test_board.spaces = [[".", ".", ".", ".", "x", "x"],[".", ".", ".", ".", "o", "o"],[".", ".", "x", "o", "o", "x"],[".", ".", ".", "x", "o", "o"],[".", ".", ".", ".", "x", "o"],[".", ".", ".", ".", ".", "x"], [".", ".", ".", ".", ".", "."]]
      expect(test_board.diagonal_checker).to eq(true)
      test_board.spaces = [[".", ".", ".", ".", "x", "x"],[".", ".", ".", ".", "o", "o"],[".", ".", "x", "o", "o", "x"],[".", ".", ".", "x", "o", "o"],[".", ".", ".", ".", "o", "o"],[".", ".", ".", ".", ".", "x"], [".", ".", ".", ".", ".", "."]]
      expect(test_board.diagonal_checker).to eq(false)
    end
  end

end
