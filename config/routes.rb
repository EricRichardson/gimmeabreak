Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  root to: 'static_pages#home'

  get '/static_pages/analytics1', to: 'static_pages#analytics1'
  get '/static_pages/analytics2', to: 'static_pages#analytics2'
  get '/static_pages/analytics3', to: 'static_pages#analytics3'
  get '/static_pages/home', to: 'static_pages#home'

  resources :users do
    resources :notifications
  end

  root to: 'static_pages#home'
  resources :users

    match '/auth/:provider/callback', to: 'static_pages#callback', via: [:get, :post]

  get '/login', to: 'static_pages#login'


  # get '/auth/microsoft', as: :sign_in_with_microsoft
  get '/auth/microsoft/callback' => 'callbacks#microsoft'

  resources :steps_log

  post 'users/:id/device', to: 'users#register_device'

end
