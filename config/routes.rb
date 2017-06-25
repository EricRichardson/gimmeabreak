Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'static_pages#home'
  
  get '/static_pages/analytics', to: 'static_pages#analytics'
  get '/static_pages/home', to: 'static_pages#home'

  resources :users do
    resources :notifications
  end
end
