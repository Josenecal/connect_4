require 'rspec'
require './lib/board.rb'


RSpec.describe 'Class exists' do
  it 'creates a new instance of Board object' do
    test_var = Board.new()
    expect(test_var).to be_an_instance_of(Board)
  end


  it 'is A valid on an empty board' do

    @letter = "A"
    Board.new
    @test = Board.new
    expect(valid_column?).to eq(true)
  end

  it 'is A valid on a full column' do

    @letter = "a"
    @test = Board.new
    @test.spaces.replace [["X", "O", "X", "O", "X", "O"],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."],[".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", "."]]
    expect(valid_column?).to eq(false)
  end

  it 'is X a valid choice' do

    @letter = "x"
    @test = Board.new
    expect(valid_column?).to eq(false)
  end

end
