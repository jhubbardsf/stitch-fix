require 'rails_helper'

RSpec.describe 'Manual', :type => :feature do
  before(:all) do
    FactoryGirl.create_list(:item, 10)
  end

  scenario "User enters valid IDs" do
    visit '/manual_input'

    fill_in "ids", with: '1, 2, 3'
    click_button 'Upload'

    expect(page).to have_text('3 items clearanced in batch 1')
  end

  scenario "User enters valid IDs, then tries to reenter them" do
    visit '/manual_input'

    fill_in "ids", with: '1, 2, 3'
    click_button 'Upload'

    expect(page).to have_text('3 items clearanced in batch 1')

    click_link "Custom Upload"
    fill_in "ids", with: '1, 2, 3'
    click_button 'Upload'

    expect(page).to have_text('No new clearance batch was added')
  end

  scenario "User enters invalid information in the manual field" do
    visit '/manual_input'

    fill_in "ids", with: '1, 2, 3, A'
    click_button 'Upload'

    expect(page).to have_text('Invalid input. Please only put item IDs and commas.')
  end
end