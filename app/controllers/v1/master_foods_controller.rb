module V1
  class V1::MasterFoodsController < ApplicationController
    def index
        master_foods = MasterFood.order(id: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded items', data: master_foods }
    end
  end
end
