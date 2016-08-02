require 'rails_helper'

describe "Store Service" do
  it "returns correct stores based on zip code" do
    VCR.use_cassette("all_stores") do
      zip = "80202"

      results = StoreService.new.stores_by_zip(zip)

      stores = results["stores"]

      expect(results["total"]).to eq(17)
      expect(stores.count).to eq(15)
      expect(stores.first).to eq({"longName"=>"Best Buy Mobile - Cherry Creek Shopping Center", "city"=>"Denver", "distance"=>3.25, "phone"=>"303-270-9189", "storeType"=>"Mobile", "storeId"=>2740})
    end
  end

  it "returns specific store based on store id" do
    VCR.use_cassette("single_store") do
      id = 2740

      results = StoreService.new.single_store(id)
      store = results["stores"].first

      expect(store["longName"]).to eq("Best Buy Mobile - Cherry Creek Shopping Center")
      expect(store["storeType"]).to eq("Mobile")
      expect(store["address"]).to eq("3000 East First Ave")
      expect(store["city"]).to eq("Denver")
      expect(store["region"]).to eq("CO")
      expect(store["postalCode"]).to eq("80206")
      expect(store["hoursAmPm"]).to eq("Mon: 10am-9pm; Tue: 10am-9pm; Wed: 10am-9pm; Thurs: 10am-9pm; Fri: 10am-9pm; Sat: 10am-9pm; Sun: 11am-6pm")
    end
  end
end
