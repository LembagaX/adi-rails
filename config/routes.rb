Rails.application.routes.draw do
  resources :parts
  resources :users
  post 'users/generate'
end
