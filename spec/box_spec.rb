require_relative '../lib/box'

require 'bundler'
Bundler.require


box_1 = Box.new(1,2)

describe "change_form" do

  box_1.change_form("cercle")

  it "should a string" do
    expect(box_1.form).to be_a(String)
  end
  
  it "should return argument" do
    expect(box_1.form).to eq("cercle")
  end

  it "should return a error if argument isn't cercle or cross or empty" do 
    expect(box_1.change_form("je suis")).to eq(puts "l'argument qui a été envoyer avec Box.change_form n'ai pas bon")
  end
end