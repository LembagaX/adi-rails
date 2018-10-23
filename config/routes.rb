Rails.application.routes.draw do
  resources :users
  match 'users/generate', via: [ :post, :options ]
end
