require 'rails_helper'

RSpec.describe "clothings/index", type: :view do
  before(:each) do
    assign(:clothings, [
      Clothing.create!(
        :name => "Name"
      ),
      Clothing.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of clothings" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
