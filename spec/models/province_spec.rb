require 'rails_helper'

RSpec.describe Province, type: :model do

  it "belongs to a country" do
    province = Province.create!
    expect(province).to belong_to(:country)
  end

end
