Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'static_pages#home'
  resources :users
  resources :steps_log
  
  post 'users/:id/device', to: 'users#register_device'
end
