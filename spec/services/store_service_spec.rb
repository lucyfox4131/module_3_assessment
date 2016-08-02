require 'rails_helper'

describe "Store Service" do
  it "returns correct stores based on zip code" do
    zip = "80202"

    stores = StoreService.new.stores_by_zip(zip)

    expect(stores[]
  end
end
