Rails.application.routes.draw do
  resources :cocktails do
    resources :doses, only: [:new, :create]
  end

  get 'doses/:id', to: 'doses#destroy'

  root to: 'cocktails#index'
end
