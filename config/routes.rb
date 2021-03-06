Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  resources :friendships

  post 'accept', to: 'friendships#accept'
  delete 'reject', to: 'friendships#reject'
  delete 'unfriend', to: 'friendships#unfriend'
  delete 'cancel', to: 'friendships#cancel'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
