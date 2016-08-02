require 'rails_helper'

RSpec.feature "User searches by zip for stores" do
  scenario "user visits root to search for stores by zipcode" do
    visit "/"
    fill_in "zip", with: "80202"
    click_on "Search"

    expect(current_path).to eq("/search")

    expect(page).to have_content("Best Buy Mobile - Cherry Creek Shopping Center")
    expect(page).to have_content("17 Total Stores")

    within(".store15") do
      expect(page).to have_content("Best Buy - S.E. Aurora")
      expect(page).to have_content("City: Aurora")
      expect(page).to have_content("Distance: 18.51")
      expect(page).to have_content("Phone Number: 303-693-0166")
      expect(page).to have_content("Store Type: BigBox")
    end
  end

end
