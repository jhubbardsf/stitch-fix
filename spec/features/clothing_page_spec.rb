require 'rails_helper'

RSpec.describe 'Clothing', :type => :feature do
  before(:all) do
    FactoryGirl.create(:clothing)
    FactoryGirl.create(:top)
  end

  scenario "User visits the clothing page" do
    visit '/clothings'

    expect(page).to have_text('Pants')
    expect(page).to have_text('Top')
  end

  scenario "User tries to lower pants price too low" do
    visit '/clothings'

    within all("tr")[1] do
      click_link 'Edit'
    end

    fill_in 'clothing_minimum', with: 4
    click_button 'Update Clothing'

    expect(page).to have_text('Minimum is below the minimum ($5) clearance value or invalid.')
  end

  scenario "User tries to up pants price to 10" do
    visit '/clothings'

    within all("tr")[1] do
      click_link 'Edit'
    end

    fill_in 'clothing_minimum', with: 10
    click_button 'Update Clothing'

    expect(page).to have_text('Clothing was successfully updated.')

    click_link 'Back'

    within all("tr")[1] do
      expect(page).to have_text('$10.00')
    end

    expect(page).to have_text('Listing Clothings')
  end
end