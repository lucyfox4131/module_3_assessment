require 'rails_helper'

describe "Items Controller" do
  it "should return all items successfully" do
    item_1, item_2, item_3 = create_list(:item, 3)

    get '/api/v1/items'

    expect(response.status).to eq(200)

    expect(json.first['name']).to eq(item_1.name)
    expect(json.first["name"]).to eq(item_2.name)
    expect(json.first["name"]).to eq(item_3.name)

    expect(json.first).to eq({"id" => item_1.id, "name" => item_1.name, "description" => item_1.description, "image_url" => item_1.image_url})
  end
end
