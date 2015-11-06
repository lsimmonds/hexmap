require 'rails_helper'

RSpec.describe Hex, type: :model do
  it "belongs to a map" do
    hex = Hex.create!
    expect(hex).to belong_to(:map)
  end

end
