require 'rails_helper'

RSpec.feature "Root Page" do
  scenario "reaches the root page" do
    visit root_path

    expect(page.status_code).to eq(200)

    within "h1" do
      expect(page).to have_content("Items")
    end
  end
end
