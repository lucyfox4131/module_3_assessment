class Stores
  attr_reader :name, :city, :distance, :phone, :type

  def initialize(store)
    @name = store["longName"]
    @city = store["city"]
    @distance = store["distance"]
    @phone = store["phone"]
    @type = store["storeType"]
  end

  def self.search_by_zip(zip)
    results = StoreService.new.stores_by_zip(zip)

    stores = results["stores"].map do |store|
      new(store)
    end

    [results["total"], stores]
  end
end
