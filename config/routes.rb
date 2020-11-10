Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  resources :users, except: [:edit, :update, :destroy] do
    resources :activities, only: [ :new, :create, :index ]
    resources :groups, only: [ :new, :create, :index, :show ]
  end

  devise_scope :user do
    root 'users/sessions#new'
  end

  get "/profile", to: 'users#show'
  # get "*path", to: redirect('/')
end
