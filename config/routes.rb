Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  resources :users, except: [:edit, :update, :destroy] do
    resources :activities, except: [ :edit, :update, :destroy ]
  end

  resources :groups, only: [ :new, :create, :index, :show ]

  devise_scope :user do
    root 'users/sessions#new'
  end

  get "/profile", to: 'users#show'
  get "*path", to: redirect('/')
end
