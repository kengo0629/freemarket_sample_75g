Rails.application.routes.draw do
  root to: "purchases#index"
  resources :products,only: :index
  resources :cards,only: [:index,:new]
  resources :purchases, only: [:index, :create]
end
