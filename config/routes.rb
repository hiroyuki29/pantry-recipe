Rails.application.routes.draw do
  namespace :v1 do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :items
    resources :pantries, only: [:index, :create, :destroy, :update] do
      put 'increment'
    end
    resources :user_items, only: [:index, :create, :destroy]
    resources :master_foods, only: [:index]
    resources :categories, only: [:index]
  end
end
