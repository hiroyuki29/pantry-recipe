module V1
  class V1::PantriesController < ApplicationController
    before_action :set_item, only: [:show, :update, :destroy]
    before_action :authenticate_v1_user!

    def index
      items = current_v1_user.pantry_items.preload(:pantries).select('pantries.*, items.name, items.category_id, items.master_food_id').order(:category_id, :item_id)
      render json: { status: 'SUCCESS', data: items }
    end

    def create
      item = Item.find(params[:item_id])
      current_v1_user.store_to_pantry(item, item.unit_quantity)
      render json: { status: 'SUCCESS', data: item }
    end

    def destroy
      pantry_item = current_v1_user.pantries.find(params[:id])
      pantry_item.destroy
      render json: { status: 'SUCCESS', data: pantry_item }
    end

    def update
      if @pantry.update(pantry_params)
          render json: { status: 'SUCCESS', message: 'Update the item', data: @pantry }
      else
          render json: { status: 'ERROR', message: 'Not updated', data: @pantry.errors }
      end
    end

    def increment
      pantry = Pantry.find(params[:pantry_id])
      pantry.quantity += params[:unit_quantity]
      if pantry.save
          render json: { status: 'SUCCESS', message: 'Update the item', data: pantry }
      else
          render json: { status: 'ERROR', message: 'Not updated', data: pantry.errors }
      end
    end

    def move_from_memo
      pantry = Pantry.find_by(item_id: params[:item_id])
      if pantry
        pantry.quantity += params[:quantity]
        if pantry.save
          render json: { status: 'SUCCESS', message: 'Update the item', data: pantry }
        else
          render json: { status: 'ERROR', message: 'Not updated', data: pantry.errors }
        end
      else
        item = Item.find(params[:item_id])
        current_v1_user.store_to_pantry(item, params[:quantity])
        render json: { status: 'SUCCESS', data: item }
      end
    end

    private

    def set_item
        @pantry = Pantry.find(params[:id])
    end

    def pantry_params
        params.permit(:user_id, :item_id, :quantity)
    end
  end
end
