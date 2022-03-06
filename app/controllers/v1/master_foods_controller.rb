module V1
  class V1::MasterFoodsController < ApplicationController
    def index
        items = MasterFood.order(id: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded items', data: items }
    end
  end
end
