require 'rails_helper'

RSpec.describe "conversions/edit", type: :view do
  before(:each) do
    @conversion = assign(:conversion, Conversion.create!(
      base_currency: "MyString",
      target_currency: "MyString",
      conv_count: 1
    ))
  end

  it "renders the edit conversion form" do
    render

    assert_select "form[action=?][method=?]", conversion_path(@conversion), "post" do

      assert_select "input[name=?]", "conversion[base_currency]"

      assert_select "input[name=?]", "conversion[target_currency]"

      assert_select "input[name=?]", "conversion[conv_count]"
    end
  end
end
