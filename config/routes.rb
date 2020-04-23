Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index] do
    member do
      get :following, :followers
    end
   end
   namespace :users do
    resources :searches, only: :index
  end
   resources :relationships,   only: [:create, :destroy]
   root to: "events#index"
   resources :events do
    resources :likes, only: [:create, :destroy]
  end
   resources :records  ,except: [:edit, :update]   
end
