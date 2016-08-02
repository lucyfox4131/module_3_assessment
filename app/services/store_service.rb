class StoreService
  def initialize
    @_connection = Faraday.new("https://api.bestbuy.com")
  end

  def stores_by_zip(zip)
    parse(connection.get("/v1/stores(area(#{zip},25))", zip_search_params))
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
end
