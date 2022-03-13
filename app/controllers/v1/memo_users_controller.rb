module V1
  class V1::MemoUsersController < ApplicationController
    before_action :authenticate_v1_user!

    def index
      memos = current_v1_user.memos
      render json: { status: 'SUCCESS', data: memos }
    end

    def create
      memo = Memo.find(params[:memo_id])
      current_v1_user.store_to_memo_user(memo)
      render json: { status: 'SUCCESS', data: memo }
    end

    def destroy
      memo = current_v1_user.memos.find(params[:id])
      memo.destroy
      ender json: { status: 'SUCCESS', data: memo }
    end

  end
end
