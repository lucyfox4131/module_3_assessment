class SearchController < ApplicationController

  def index
    @stores = Stores.search_by_zip(params["zip"])
  end
end
