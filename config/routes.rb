Rails.application.routes.draw do
  root 'products#new'
  resources 'products', only: [:new, :create]
end
