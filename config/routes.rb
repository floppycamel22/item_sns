Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'posts#index'
  devise_for :users
  resources :users do
  	member do
  		get :following, :followers
  	end
    get '/:id/user_favorites', to: "users#user_favorites", as:'user_favorites'
    get '/:id/folder_list', to: "users#folder_list", as:'folder_list'
    resources :notifications, only: [:index]
    get '/following_post', to: "users#following_post", as: 'following_post'
  end

  resources :rooms, only: [:create, :show, :index]
  resources :messages, only: [:create]
  resources :folders, only: [:new, :create, :destroy, :show]

  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    resources :folders, only: [:edit, :show]  do
      resource :folder_items, only: [:create]
    end
  end
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end