Rails.application.routes.draw do
  resources   :parts
  resources   :users do
    collection do
      post  :check
      post  :token
      get   :by_role
    end
  end
  scope :charts, controller: 'charts' do
    get :user_by_role
  end
  resources :purchases, only: [:create]
end
