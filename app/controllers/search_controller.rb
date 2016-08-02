class SearchController < ApplicationController

  def index
    @results = SearchStores.search_by_zip(params["zip"])
  end
end
