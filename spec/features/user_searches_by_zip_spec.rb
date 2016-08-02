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

    click_on("Best Buy Mobile - Cherry Creek Shopping Center")

    expect(current_path).to eq("/stores/2740")
    expect(page).to have_content("Best Buy Mobile - Cherry Creek Shopping Center")
    expect(page).to have_content("Store Type: Mobile")
    expect(page).to have_content("Location: 3000 East First Ave Denver, CO, 80206")

    expect(page).to have_content("Visit During These Hours:")
    
    expect(page).to have_content("Mon: 10am-9pm")
    expect(page).to have_content("Tue: 10am-9pm")
    expect(page).to have_content("Wed: 10am-9pm")
    expect(page).to have_content("Thurs: 10am-9pm")
    expect(page).to have_content("Fri: 10am-9pm")
    expect(page).to have_content("Sat: 10am-9pm")
    expect(page).to have_content("Sun: 11am-6pm")
  end
end
