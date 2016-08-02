class StoreService
  def initialize
    @_connection = Faraday.new("https://api.bestbuy.com")
  end

  def stores_by_zip(zip)
    parse(connection.get("/v1/stores(area(#{zip},25))", zip_search_params))
  end

  def single_store(id)
    https://api.bestbuy.com/v1/stores(storeId=2740)?format=json&apiKey=hhp47b5bvjda7pj44gsauf78&show=longName,storeType,address,city,region,postalCode,hoursAmPm
  end

  private

  def parse(response)
    JSON.parse(response.body)
  end

  def connection
    @_connection
  end

  def zip_search_params
    {
      format: "json",
      show: "longName,city,distance,phone,storeType,storeId",
      apiKey: ENV["BEST_BUY_API_KEY"],
      pageSize: 15
    }
  end

  def single_store_params
    {
      format: "json"
    }
  end
end
