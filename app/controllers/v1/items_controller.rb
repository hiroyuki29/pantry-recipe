module V1
  class V1::ItemsController < ApplicationController
    before_action :set_item, only: [:show, :update, :destroy]
    before_action :authenticate_v1_user!

    def index
        items = current_v1_user.items_had_user.order(:category_id, :item_id)
        render json: { status: 'SUCCESS', message: 'Loaded items', data: items }
    end

    def show
        render json: { status: 'SUCCESS', message: 'Loaded the item', data: @item }
    end

    def create
        # item = Item.new(item_params)
        item = Item.find_or_initialize_by(item_params)
        if item.new_record?
          if item.save
              render json: { status: 'SUCCESS', data: item }
          else
              render json: { status: 'ERROR', data: item.errors }
          end
        else
          render json: { status: 'SUCCESS', data: item }
        end
    end

    def destroy
        @item.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the item', data: @item }
    end

    def update
        if @item.update(item_params)
            render json: { status: 'SUCCESS', message: 'Update the item', data: @item }
        else
            render json: { status: 'ERROR', message: 'Not updated', data: @item.errors }
        end
    end

    private

    def set_item
        @item = Item.find(params[:id])
    end

    def item_params
        params.permit(:name, :category_id, :master_food_id, :unit_quantity)
    end
  end

end
