require './lib/computer.rb'

RSpec.describe 'Class exists' do
  it "computer choice chooses empty row" do
    test_board = Board.new
    test_board.spaces = [["x", "x", "o", "x", "o", "x"],["x", "x", "o", "x", "o", "x"],[".", ".", ".", ".", ".", "."],["x", "x", "o", "x", "o", "x"],["x", "x", "o", "x", "o", "x"],["o", "x", "o", "x", "o", "x"], ["x", "x", "o", "x", "o", "x"]]
    computer = Computer.new
    expect(computer.gets_column(test_board)).to eq(2)
  end
end
