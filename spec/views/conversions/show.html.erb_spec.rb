require 'rails_helper'

RSpec.describe "conversions/show", type: :view do
  before(:each) do
    @conversion = assign(:conversion, Conversion.create!(
      base_currency: "Base Currency",
      target_currency: "Target Currency",
      conv_count: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Base Currency/)
    expect(rendered).to match(/Target Currency/)
    expect(rendered).to match(/2/)
  end
end
