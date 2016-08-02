class StoresController < ApplicationController
  def show
    @store = Store.single_store(params["id"])
  end
end
