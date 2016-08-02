require 'rails_helper'

describe "Items Controller" do
  it "should return all items successfully" do
    item_1, item_2, item_3 = create_list(:item, 3)

    get '/api/v1/items'

    expect(response.status).to eq(200)

    expect(json).to include(item_1.name)
    expect(json).to include(item_2.name)
    expect(json).to include(item_3.name)
  end
end
