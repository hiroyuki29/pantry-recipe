module V1
  class V1::MemoItemsController < ApplicationController
    before_action :set_item, only: [:show, :update, :destroy]
    before_action :authenticate_v1_user!

    def items
      items = Memo.find(params[:memo_item_id]).items.preload(:memo_items).select('memo_items.*, items.name, items.category_id').order(:category_id, :item_id)
      render json: { status: 'SUCCESS', data: items }
    end

    def create
      memo = Memo.find(params[:memo_id])
      item = Item.find(params[:item_id])
      memo.store_to_memo_item(item, params[:quantity])
      render json: { status: 'SUCCESS', data: item }
    end

    def destroy
      memo = Memo.find(params[:memo_id])
      memo_item = memo.memo_items.find(params[:id])
      memo_item.destroy
      render json: { status: 'SUCCESS', data: memo_item }
    end

    def update
      if @memo_item.update(memo_item_params)
        render json: { status: 'SUCCESS', message: 'Update the memo', data: @memo }
    else
        render json: { status: 'ERROR', message: 'Not updated', data: @memo.errors }
    end
    end

    def increment
      memo_item = MemoItem.find(params[:memo_item_id])
      memo_item.quantity += params[:unit_quantity]
      if memo_item.save
          render json: { status: 'SUCCESS', message: 'Update the memo', data: memo_item }
      else
          render json: { status: 'ERROR', message: 'Not updated', data: memo_item.errors }
      end
    end

    private

    def set_item
        @memo_item = MemoItem.find(params[:id])
    end

    def memo_item_params
        params.permit(:memo_id, :item_id, :quantity, :done)
    end

  end
end
