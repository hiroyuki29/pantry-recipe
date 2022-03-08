module V1
  class V1::CategoriesController < ApplicationController
    def index
      categories = Category.order(id: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded items', data: categories }
    end
  end
end
