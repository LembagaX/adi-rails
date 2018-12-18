Rails.application.routes.draw do
  resources :parts
  resources :users do
    collection do
      post :check
      post :token
    end
  end
end
