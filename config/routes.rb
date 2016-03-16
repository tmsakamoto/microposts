Rails.application.routes.draw do
  get 'sessions/new'

  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users do
    member do
      get :followings, :followers
    end
  end
  resources :microposts
  resources :comments
  resources :relationships, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
end
