module V1
  class V1::MemosController < ApplicationController
    before_action :set_memo, only: [:show, :update, :destroy]
    before_action :authenticate_v1_user!

    def index
      memos = current_v1_user.memos_had_user
      render json: { status: 'SUCCESS', message: 'Loaded memos', data: memos }
    end

    def show
      render json: { status: 'SUCCESS', message: 'Loaded the memo', data: @memo }
    end

    def create
      memo = Memo.new(memo_params)
        if memo.save
            render json: { status: 'SUCCESS', data: memo }
        else
            render json: { status: 'ERROR', data: memo.errors }
        end
    end

    def destroy
      @memo.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the memo', data: @memo }
    end

    def update
      if @memo.update(memo_params)
        render json: { status: 'SUCCESS', message: 'Update the memo', data: @memo }
      else
        render json: { status: 'ERROR', message: 'Not updated', data: @memo.errors }
      end
    end

    def search
      memo = Memo.find_by(name: memo_params[:name], password: memo_params[:password])
      if memo
        render json: { status: 'SUCCESS', message: 'searched the memo', data: memo }
      else
        render json: { status: 'ERROR', message: 'Faild find user'}
      end
    end

    private

    def set_memo
        @memo = Memo.find(params[:id])
    end

    def memo_params
        params.permit(:name, :password)
    end

  end
end
