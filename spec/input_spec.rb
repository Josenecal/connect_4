require 'rspec'
require './lib/input.rb'
require 'pry'


RSpec.describe 'Class exists' do
  it "A returns 0" do
    letter = Input.new("A")
    expect(letter.translator).to eq(0)
  end

  it "a returns 0" do
    letter = Input.new("a")
    expect(letter.translator).to eq(0)
  end

  it "D returns 3" do
    letter = Input.new("D")
    expect(letter.translator).to eq(3)
  end
end
