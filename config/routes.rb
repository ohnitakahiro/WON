Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index] do
    member do
      get :following, :followers
    end
   end
   resources :relationships,   only: [:create, :destroy]
   root to: "events#index"
   resources :events do
    resources :comments, only: :create
    resources :menus, only: [:index, :new, :create]     
    resources :likes, only: [:create, :destroy]
  end
  resources :menu_selects, only: [:new, :create]
end
