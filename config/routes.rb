Rails.application.routes.draw do
  namespace :v1 do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :items
    resources :master_foods, only: [:index]
    resources :categories, only: [:index]
  end
end
