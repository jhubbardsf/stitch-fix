require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    FactoryGirl.create(:style)
    assign(:item, Item.new(
      :id => 1,
      :size => "",
      :color => "",
      :status => "sellable",
      :price_sold => "9.99",
      :sold_at => "9.99",
      :style_id => 1,
      :clearance_batch_id => 1
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input#item_id[name=?]", "item[id]"

      assert_select "input#item_size[name=?]", "item[size]"

      assert_select "input#item_color[name=?]", "item[color]"

      assert_select "input#item_status[name=?]", "item[status]"

      assert_select "input#item_price_sold[name=?]", "item[price_sold]"

      assert_select "input#item_sold_at[name=?]", "item[sold_at]"

      assert_select "select#item_style_id[name=?]", "item[style_id]"

      assert_select "input#item_clearance_batch_id[name=?]", "item[clearance_batch_id]"
    end
  end
end
