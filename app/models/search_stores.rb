class SearchStores
  attr_reader :id, :name, :city, :distance, :phone, :type

  def initialize(store)
    @id         = store["storeId"]
    @name       = store["longName"]
    @city       = store["city"]
    @distance   = store["distance"]
    @phone      = store["phone"]
    @type       = store["storeType"]
  end

  def self.service
    StoreService.new
  end

  def self.search_by_zip(zip)
    results = service.stores_by_zip(zip)
    stores = create_new_stores(results)

    [results["total"], stores]
  end

  def self.create_new_stores(results)
    results["stores"].map {|store| new(store)}
  end
end
