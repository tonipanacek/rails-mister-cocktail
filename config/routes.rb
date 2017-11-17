Rails.application.routes.draw do
  get 'pages/index'

  resources :cocktails do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]

  root to: 'pages#index'
end
