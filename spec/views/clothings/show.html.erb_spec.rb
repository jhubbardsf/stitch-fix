require 'rails_helper'

RSpec.describe "clothings/show", type: :view do
  before(:each) do
    @clothing = assign(:clothing, Clothing.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
