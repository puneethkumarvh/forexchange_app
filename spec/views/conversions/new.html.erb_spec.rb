require 'rails_helper'

RSpec.describe "conversions/new", type: :view do
  before(:each) do
    assign(:conversion, Conversion.new(
      base_currency: "MyString",
      target_currency: "MyString",
      conv_count: 1
    ))
  end

  it "renders new conversion form" do
    render

    assert_select "form[action=?][method=?]", conversions_path, "post" do

      assert_select "input[name=?]", "conversion[base_currency]"

      assert_select "input[name=?]", "conversion[target_currency]"

      assert_select "input[name=?]", "conversion[conv_count]"
    end
  end
end
