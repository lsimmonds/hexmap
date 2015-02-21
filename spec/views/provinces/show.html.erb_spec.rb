require 'rails_helper'

RSpec.describe "provinces/show", type: :view do
  before(:each) do
    @province = assign(:province, Province.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
