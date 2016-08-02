require 'rails_helper'

RSpec.feature "User searches by zip for stores" do
  scenario "user visits root to search for stores by zipcode" do
    visit "/"
    fill_in "zip", with: "80202"
    click_on "Search"

    expect(current_path).to eq("/search")

    expect(page).to have_link("Best Buy Mobile - Cherry Creek Shopping Center")
    expect(page).to have_content("17 Total Stores")

    expect(page).to have_link("Best Buy - S.E. Aurora")
    expect(page).to have_content("City: Aurora")
    expect(page).to have_content("Distance: 18.51")
    expect(page).to have_content("Phone Number: 303-693-0166")
    expect(page).to have_content("Store Type: BigBox")


  end

end

#
# As a user
# After I have searched a zip code for stores
# When I click the name of a store
# Then my current path should be "/stores/:store_id"
# I should see the store name, store type and address with city, state and zip
# I should see an unordered list of the store hours in the following format:
#   * Mon: 10am-9pm
#   * Tue: 10am-9pm
#   * Wed: 10am-9pm
#   * Thurs: 10am-9pm
#   * Fri: 10am-9pm
#   * Sat: 10am-9pm
#   * Sun: 11am-7pm
