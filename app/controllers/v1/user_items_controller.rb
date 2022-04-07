module V1
  class V1::UserItemsController < ApplicationController
    before_action :set_item, only: [:destroy]

    def index
      items = current_v1_user.items.preload(:user_items).select('user_items.*, items.name, items.category_id, items.master_food_id, items.unit_quantity').order(:category_id, :item_id)
      render json: { status: 'SUCCESS', data: items }
    end

    def create
      item = Item.find(params[:item_id])
        current_v1_user.store_to_user(item)
        render json: { status: 'SUCCESS', data: item }
    end

    def destroy
      @item.destroy
      render json: { status: 'SUCCESS', message: 'Deleted the item', data: @item }
    end

    private

    def set_item
        @item = UserItem.find(params[:id])
    end


  end
end
