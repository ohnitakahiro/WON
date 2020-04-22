Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  root to: "events#index"
  resources :events
  resources :records  ,except: [:edit, :update]
end
