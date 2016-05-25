Rails.application.routes.draw do
  namespace :admin do
    resources :attendees
    resources :events
    resources :users

    root to: 'events#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get ':event/checkin', to: 'events#checkin', as: 'event_checkin'
  get 'privacy-policy', to: 'pages#privacy'
  get 'auth/:provider/callback', to: 'sessions#create'
  post 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'login', to: 'identities#login', as: 'login'
  get 'signup', to: 'identities#new', as: 'signup'
  get ':event/user/edit', to: 'users#edit', as: 'edit_user'
  patch 'user/', to: 'users#update', as: 'user'

  root 'events#index'

  resources :identities
end
