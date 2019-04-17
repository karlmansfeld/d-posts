Rails.application.routes.draw do
  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, only: [:index,  :show,  :new, :create] do
    member do
      get :following, :followers, :likes
    end


  end
  resources :microposts
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
