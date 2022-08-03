Rails.application.routes.draw do
  root 'static_pages#top'

  get 'privacy', to: 'static_pages#privacy'
  get 'userpolicy', to: 'static_pages#userpolicy'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  get '/logout' => 'user_sessions#destroy'

  resources :users
  resources :shops, only: %i[index show]
end
