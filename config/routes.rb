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
    collection do
      get 'search'
    end
    member do
      get 'compare'
      post 'compare'
      get 'ajax'
      post 'ajax'
    end
  end
  resources :users, only: [:show, :edit, :update]
end
