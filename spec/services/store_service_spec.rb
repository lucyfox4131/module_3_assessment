require 'rails_helper'

describe "Store Service" do
  it "returns correct stores based on zip code" do
    zip = "80202"

    results = StoreService.new.stores_by_zip(zip)

    stores = results["stores"]

    expect(results["total"]).to eq(17)
    expect(stores.count).to eq(15)
    expect(stores.first).to eq({"longName"=>"Best Buy Mobile - Cherry Creek Shopping Center", "city"=>"Denver", "distance"=>3.25, "phone"=>"303-270-9189", "storeType"=>"Mobile", "storeId"=>2740})
  end
end
