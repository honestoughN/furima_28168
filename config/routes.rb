Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    member do
      resources :orders, only: [:new, :create]
      post 'orders/new' => 'orders#new'
    end
    resources :comments, only: [:new, :create]
  end
end
