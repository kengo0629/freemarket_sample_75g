Rails.application.routes.draw do
  root to: "products#index"
  resources :products,only: [:index, :new, :create] do
  collection do
    get 'category/get_category_children', to: 'products#get_category_children', defaults: { format: 'json' }
    get 'category/get_category_grandchildren', to: 'products#get_category_grandchildren', defaults: { format: 'json' }
    end
  end
end
