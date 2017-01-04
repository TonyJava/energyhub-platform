Rails.application.routes.draw do
  resources :proposals
  resources :contractors
  resources :projects
  resources :sites
  resources :participants
  resources :hubs
  root to: 'pages#home'
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
