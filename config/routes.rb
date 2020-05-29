Rails.application.routes.draw do

  root to: "purchases#index"
  resources :cards,only: [:index,:new]
  resources :purchases, only: [:index, :create]
  resources :products,only: [:index, :show] do
  collection do
    get 'category/get_category_children', to: 'products#get_category_children', defaults: { format: 'json' }
    get 'category/get_category_grandchildren', to: 'products#get_category_grandchildren', defaults: { format: 'json' }
    end
  end
end
