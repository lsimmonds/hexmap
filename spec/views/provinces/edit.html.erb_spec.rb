require 'rails_helper'

RSpec.describe "provinces/edit", type: :view do
  before(:each) do
    @province = assign(:province, Province.create!())
  end

  it "renders the edit province form" do
    render

    assert_select "form[action=?][method=?]", province_path(@province), "post" do
    end
  end
end
