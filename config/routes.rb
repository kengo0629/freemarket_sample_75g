Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: "products#index"
resources :products,only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :cards,only: [:index,:new,:show,:create,:destroy] do
      collection do
        post "buy", to: "cards#buy"
      end
    end
end

resources :mypages,only: [:show] do
  resources :cards,only: [:index,:new,:show,:create,:destroy] do
    collection do
      post "buy", to: "cards#buy"
    end
  end
end

  # resources :purchases, only: [:index, :create]

  resources :products,only: [:index, :new, :create, :show, :edit, :update, :destroy] do
  collection do
    get 'category/get_category_children', to: 'products#get_category_children', defaults: { format: 'json' }
    get 'category/get_category_grandchildren', to: 'products#get_category_grandchildren', defaults: { format: 'json' }
    end
  resources :purchases,only: [:index] do
    collection do
      get 'index', to: 'purchases#index'
      post 'done', to: 'purchases#done'
    end
  end
  end

  resources :products,only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :purchases,only: [:index] do
      collection do
        get 'index', to: 'purchases#index'
        post 'done', to: 'purchases#done'
      end
    end
    end
end

