Rails.application.routes.draw do
  root to: "companies#index"
  resources :users do
    resources :messages #messages are stuctured to be children of a user, but
    # the code does not require this. Maybe messages doesn't need to be nested?
    resources :companies
  end

  resources :companies, only: [:index, :show, :create] do
    resources :favorite_companies, only: [:create, :destroy] # excellent custom route!!!
    put 'upvote', to: "companies#upvote"
  end

  resources :sessions

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  get 'favorites', to: 'favorite_companies#index', as: 'favorites'
end
