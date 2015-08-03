Rails.application.routes.draw do
  root to: "companies#index"
  resources :users do
    resources :companies
  end

  resources :companies, only: [:index]
end
