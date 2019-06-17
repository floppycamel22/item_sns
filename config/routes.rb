Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  resources :users do
  	member do
  		get :following, :followers
  	end
    get '/:id/user_favorites', to: "users#user_favorites", as:'user_favorites'
  end

  resources :folders, only: [:new, :create, :destroy]

  resources :posts do
    resources :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    resources :folders, only: [:show]  do
      resources :folder_items, only: [:create, :destroy]
    end
  end
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end