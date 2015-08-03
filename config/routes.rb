Rails.application.routes.draw do
  root to: "companies#index"
  resources :users do
    resources :companies
  end

  resources :companies, only: [:index, :create]

  get '/sign_in', to: 'users#sign_in'
  post '/sign_in', to: 'users#sign_in!'
  get '/sign_up', to: 'users#sign_up'
  post '/sign_up', to: 'users#sign_up!'
  get '/sign_out', to: 'users#sign_out'

end
