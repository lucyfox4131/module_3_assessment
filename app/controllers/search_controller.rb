class SearchController < ApplicationController

  def index
    @results = Stores.search_by_zip(params["zip"])
  end
end
