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

  it "should return one item specified by item id" do
    item_1, item_2 = create_list(:item, 2)

    get "api/v1/items/#{item_1.id}"

    expect(response.status).to eq(200)

    expect(json["id"]).to eq(item_1.id)
    expect(json["name"]).to eq(item_1.name)
    expect(json["description"]).to eq(item_1.description)
    expect(json).to_not include("created_at")
    expect(json).to_not include("udpated_at")
  end

  it "should delete item by id" do
    item_1, item_2 = create_list(:item, 2)

    expect(Item.count).to eq(2)

    delete "api/v1/items/#{item_1.id}"

    expect(response.status).to eq(204)
    expect(Item.count).to eq(1)
  end

  it "creates a new item" do
    expect(Item.count).to eq(0)
    item_params = {name: "New Item Name",
                  description: "This is the new item description",
                  image_url: "http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200"}

    post "api/v1/items", {item: item_params}

    expect(response.status).to eq(201)
    expect(json["name"]).to eq("New Item Name")
    expect(json["description"]).to eq("This is the new item description")
    expect(json["image_url"]).to eq("http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200")
    expect(json).to_not include("created_at")
    expect(json).to_not include("updated_at")
  end
end
