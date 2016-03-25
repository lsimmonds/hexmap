require 'rails_helper'

RSpec.describe Map, type: :model do

  it "has many countries" do
    map = Map.create!
    map.countries.create!
    expect(map).to have_many(:countries)
  end

  it "has many hexes" do
    map = Map.create!
    map.hexes.create!
    expect(map).to have_many(:hexes)
  end

  it "destroys countries when it is destroyed" do
    map = Map.create!
    map.countries.create!
    countries=map.countries
    map.destroy
    expect(countries).to be_empty
  end

  it "pre-loads background images" do
    allow(Dir).to receive(:glob).with("app/assets/images/hex_*.{jpg,png,gif}").and_return(["app/assets/images/hex_one.png", "app/assets/images/hex_two_too.png"])
    map = Map.create!
    expect(map.hex_images).to eql([{:name => "one",:display => "One", :path => "app/assets/images/hex_one.png"},{:name => "twoToo",:display => "Two Too", :path => "app/assets/images/hex_two_too.png"}]);
  end

  it "pre-loads add on images" do
    allow(Dir).to receive(:glob).with("app/assets/images/adn_*.{jpg,png,gif}").and_return(["app/assets/images/adn_one.png", "app/assets/images/adn_two_too.png"])
    map = Map.create!
    expect(map.addon_images).to eql([{:name => "one",:display => "One", :path => "app/assets/images/adn_one.png"},{:name => "twoToo",:display => "Two Too", :path => "app/assets/images/adn_two_too.png"}]);
  end

  it "pre-loads movable images" do
    allow(Dir).to receive(:glob).with("app/assets/images/mbu_*.{jpg,png,gif}").and_return(["app/assets/images/mbu_one.png", "app/assets/images/mbu_two_too.png"])
    map = Map.create!
    expect(map.mbu_images).to eql([{:name => "one",:display => "One", :path => "app/assets/images/mbu_one.png"},{:name => "twoToo",:display => "Two Too", :path => "app/assets/images/mbu_two_too.png"}]);
  end

end
