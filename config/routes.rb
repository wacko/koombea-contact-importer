Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :uploads, only: [:index, :new, :create, :destroy] do
    post :import, on: :member
  end
  resources :contacts, only: [:index]

  get '/uploads', to: 'uploads#index', as: :user_root
  root to: 'pages#index'
end
