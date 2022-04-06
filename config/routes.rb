Rails.application.routes.draw do
  namespace :v1 do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :items
    resources :pantries, only: [:index, :create, :destroy, :update] do
      put 'increment'
    end
    post 'pantries/move_from_memo', to: 'pantries#move_from_memo'
    resources :user_items, only: [:index, :create, :destroy]
    resources :memos 
    post 'memos/search', to: 'memos#search'
    resources :memo_users, only: [:index, :create, :destroy]
    resources :memo_items, only: [:create, :destroy, :update] do
      get 'items'
      put 'increment'
    end
    resources :master_foods, only: [:index]
    resources :categories, only: [:index]

    if Rails.env.development?
      mount LetterOpenerWeb::Engine, at: "/letter_opener"
    end
  end
end
