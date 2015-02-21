require 'rails_helper'

RSpec.describe "provinces/index", type: :view do
  before(:each) do
    assign(:provinces, [
      Province.create!(),
      Province.create!()
    ])
  end

  it "renders a list of provinces" do
    render
  end
end
