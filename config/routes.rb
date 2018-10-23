Rails.application.routes.draw do
  resources :users
  post 'users/generate'
end
