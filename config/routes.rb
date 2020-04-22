Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  resources :events
  resources :records  ,except: [:edit, :update]
  resources :users, only: :show
end
