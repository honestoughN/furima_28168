Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/create'
  devise_for :users
  root to: "items#index"
  resources :items do
    member do
      resources :orders, only: [:new, :create]
      post 'orders/new' => 'orders#new'
    end
  end
end
