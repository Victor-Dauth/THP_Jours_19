require_relative '../lib/board'
require_relative '../lib/box'

require 'bundler'
Bundler.require

box_array = []
3.times {|i| 3.times {|n| box_array << Box.new(i,n)}}
board_1 = Board.new(box_array)

describe "draw_board" do

  it "should return a string" do
    expect(board_1.draw_board).to be_a(String)
  end 
end