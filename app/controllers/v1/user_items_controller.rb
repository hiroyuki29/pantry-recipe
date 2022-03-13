module V1
  class V1::UserItemsController < ApplicationController

    def index
      items = current_v1_user.items
      render json: { status: 'SUCCESS', data: items }
    end
    def create
      item = Item.find(params[:item_id])
        current_v1_user.store_to_user(item)
        render json: { status: 'SUCCESS', data: item }
    end
  end
end
