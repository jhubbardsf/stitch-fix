require 'rails_helper'

RSpec.describe "clothings/edit", type: :view do
  before(:each) do
    @clothing = assign(:clothing, Clothing.create!(
      :name => "MyString",
      :minimum => 3
    ))
  end

  it "renders the edit clothing form" do
    render

    assert_select "form[action=?][method=?]", clothing_path(@clothing), "post" do

      assert_select "input#clothing_name[name=?]", "clothing[name]"
    end
  end
end
