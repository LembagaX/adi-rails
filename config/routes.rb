Rails.application.routes.draw do
  post 'users/check'
  resources :parts
  resources :users
  post 'users/generate'
end
