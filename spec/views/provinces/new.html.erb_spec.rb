require 'rails_helper'

RSpec.describe "provinces/new", type: :view do
  before(:each) do
    assign(:province, Province.new())
  end

  it "renders new province form" do
    render

    assert_select "form[action=?][method=?]", provinces_path, "post" do
    end
  end
end
