require 'pry'
require 'rspec'
require './lib/board.rb'
require './lib/turn.rb'

RSpec.describe 'place_piece' do

  it 'is_tie return true if board is full' do
    test_board = Board.new
    test_board.spaces = [["x", "x", "o", "x", "o", "o"],["o", "o", "x", "o", "x", "x"],["x", "x", "o", "x", "o", "o"],["o", "x", "o", "x", "o", "x"],["x", "x", "o", "x", "o", "o"],["o", "o", "x", "o", "x", "x"], ["x", "x", "o", "x", "o", "o"]]
    test_turn = Turn.new
    expect(test_turn.is_tie?(test_board)).to eq(true)
  end
  #Though about adding functionality to prevent a player from adding a piece to a column that is already full, but this isn't really a job for the place_piece method, this is for the column_full? method. They can interact in the runner.

  it 'is_tie false if board is empty' do
    test_board = Board.new
    test_turn = Turn.new
    expect(test_turn.is_tie?(test_board)).to eq(false)
  end

end
