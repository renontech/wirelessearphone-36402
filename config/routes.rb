Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :show] do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end
end
