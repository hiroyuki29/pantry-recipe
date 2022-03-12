module V1
  class V1::MasterFoodsController < ApplicationController
    def index
        master_foods = MasterFood.order(category_id: :asc)
        render json: { status: 'SUCCESS', message: 'Loaded items', data: master_foods }
    end
  end
end
