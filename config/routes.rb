Rails.application.routes.draw do
  resources :providers, except: [:create]
  resources :materials, except: [:create] do
    resources :depreciations, except: [:update]
    resources :purchases, only: [:create, :index]
  end
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
