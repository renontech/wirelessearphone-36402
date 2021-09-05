Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
    resource :favorites, only: [:create, :destroy]
    # patch "like", "unlike", on: :member
    # get "favorite", on: :collection
  end
  resources :users, only: :show
end
