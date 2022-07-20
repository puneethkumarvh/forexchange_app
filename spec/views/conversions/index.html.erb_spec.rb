require 'rails_helper'

RSpec.describe "conversions/index", type: :view do
  before(:each) do
    assign(:conversions, [
      Conversion.create!(
        base_currency: "Base Currency",
        target_currency: "Target Currency",
        conv_count: 2
      ),
      Conversion.create!(
        base_currency: "Base Currency",
        target_currency: "Target Currency",
        conv_count: 2
      )
    ])
  end

  it "renders a list of conversions" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Base Currency".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Target Currency".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
