require 'rails_helper'

RSpec.describe Country, type: :model do

  it "belongs to a map" do
    country = Country.create!
    expect(country).to belong_to(:map)
  end

  it "has many provinces" do
    country = Country.create!
    country.provinces.create!
    expect(country).to have_many(:provinces)
  end

  it "destroys provinces when it is destroyed" do
    country = Country.create!
    country.provinces.create!
    provinces=country.provinces
    country.destroy
    expect(provinces).to be_empty
  end

end
