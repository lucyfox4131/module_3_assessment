class Api::V1::ItemsController < ApiBaseController
  respond_to :json

  def index
    respond_with Item.all
  end
end
