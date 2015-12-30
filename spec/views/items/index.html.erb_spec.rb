require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    FactoryGirl.create(:style)
    assign(:items, [
      Item.create!(
        :id => 1,
        :size => "M",
        :color => "RED",
        :status => "sellable",
        :price_sold => "9.99",
        :sold_at => "9.99",
        :style_id => 1,
        :clearance_batch_id => 3
      ),
      Item.create!(
        :id => 2,
        :size => "M",
        :color => "RED",
        :status => "sellable",
        :price_sold => "9.99",
        :sold_at => "9.99",
        :style_id => 1,
        :clearance_batch_id => 3
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 1
    assert_select "tr>td", :text => 2.to_s, :count => 1
    assert_select "tr>td", :text => "M".to_s, :count => 2
    assert_select "tr>td", :text => "RED".to_s, :count => 2
    assert_select "tr>td", :text => "sellable".to_s, :count => 2
    assert_select "tr>td", :text => "$9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Bubble Pants".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
