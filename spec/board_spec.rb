require 'rspec'
require './lib/board.rb'
require './lib/input.rb'


RSpec.describe 'Class exists' do
  it 'creates a new instance of Board object' do
    test_var = Board.new()
    expect(test_var).to be_an_instance_of(Board)
  end
  describe 'place_piece' do
    it 'Accepts a single argument representing a column, and adds a piece to the first available space of the given column' do
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

    xit 'accepts input A on an empty board' do
      test_board = Board.new
      test_board.spaces = [[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", "."]]
      choice = Input.new("A")
      expect(test_board.valid_column?(choice)).to eq true
    end

    xit 'accepts input A on an empty board' do
      test_board = Board.new
      test_board.spaces = [[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", "."]]
      choice = Input.new("A")
      expect(test_board.valid_column?(choice)).to eq true
    end


    xit 'refuses input D on an empty board' do
      test_board = Board.new
      test_board.spaces = [[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],["x", "x", "x", "x", "x", "x"],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", "."]]
      choice = Input.new("d")
      expect(test_board.valid_column?(choice)).to eq false
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


  xit 'accepts input A on an empty board' do
    test_board = Board.new
    test_board.spaces = [[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", "."]]
    choice = Input.new("A")
    expect(test_board.valid_column?(choice)).to eq true
  end

  it 'detects 3 in a row' do
    test_board = Board.new
    test_board.spaces = [[".", ".", ".", "X", "X", "X"],[".", ".", ".", ".", ".", "."],[".", ".", ".", "X", "X", "X"],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", "."]]
    test_board.vertical_three_checker
    expect(test_board.vertical_three_checker).to eq({:three_in_a_row=>true, :column=>0})
    # expect(test_board.vertical_three_checker).to eq(false)
    # expect(test_board.vertical_3_checker.checker_hashto eq()
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
