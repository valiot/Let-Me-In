Rails.application.routes.draw do
  namespace :admin do
    resources :attendees
    resources :events
    resources :users

    root to: 'events#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'privacy-policy', to: 'pages#privacy'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'pages#privacy'

  resources :identities

  scope path: ':event', module: 'event', as: 'event' do
    # root to: 'sessions#new', as: 'login'
    # get 'login' => 'sessions#new'
    # post 'login' => 'sessions#create'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    get 'checkin', to: 'attendees#new', as: 'checkin'
    post 'checkin', to: 'attendees#create', as: 'post_checkin'
    get 'register', to: 'sessions#new', as: 'register'
    post 'register', to: 'sessions#create', as: 'post_register'
    get 'user/edit', to: 'users#edit', as: 'edit_user'
    patch 'user/', to: 'users#update', as: 'user'
  end
end
