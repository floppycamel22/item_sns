Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  resources :users
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resource :post_comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
