Rails.application.routes.draw do
  root to: "companies#index"
  resources :users do
    resources :companies do
        put 'upvote', to: "companies#upvote"
    end
  end
  resources :sessions
  resources :favorite_companies, only: [:create, :destroy]
  resources :companies, only: [:index, :create]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

end
