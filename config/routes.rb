Rails.application.routes.draw do
  devise_for :users
  root to: "records#index"
  resources :records  ,except: [:edit, :update]
  resources :users, only: :show
  resources :events
end
