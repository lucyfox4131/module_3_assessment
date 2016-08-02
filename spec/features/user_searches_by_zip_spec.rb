require 'rails_helper'

RSpec.feature "User searches by zip for stores" do
  scenario "user visits root to search for stores by zipcode" do
    visit "/"
    fill_in "zip", with: "80202"
    click_on "Search"

    expect(current_path).to eq("/search")

  end
# And I should see stores within 25 miles of 80202
# And I should see a message that says "17 Total Stores"
# And I should see exactly 15 results
# And I should see the long name, city, distance, phone number and store type for each of the 15 results
end
