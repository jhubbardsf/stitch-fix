require 'rails_helper'

RSpec.describe "clothings/new", type: :view do
  before(:each) do
    assign(:clothing, Clothing.new(
      :name => "MyString"
    ))
  end

  it "renders new clothing form" do
    render

    assert_select "form[action=?][method=?]", clothings_path, "post" do

      assert_select "input#clothing_name[name=?]", "clothing[name]"
    end
  end
end
