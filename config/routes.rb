Rails.application.routes.draw do
  resources :currencies
  resources :manufactures do
    resources :manifests, only: [:create, :update, :destroy]
  end
  resources :products do
    resources :assemblies, only: [:index, :create, :update, :destroy]
  end
  resources :categories
  resources :providers, except: [:create]
  resources :materials, except: [:create] do
    resources :depreciations, except: [:update]
    resources :purchases, only: [:index]
  end
  resources :purchases, only: [:create]
  resources   :users do
    collection do
      post  :check
      post  :token
      get   :by_role
    end
  end
  scope :charts, controller: 'charts' do
    get :user_by_role
    get :purchasing_growth
  end
end
