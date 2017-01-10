Rails.application.routes.draw do
  get 'hubs/:hub_id/participants/new', to: 'participants#new_hub_participant', as: 'new_hub_participant'
  post 'hubs/:hub_id/participants/new', to: 'participants#create_hub_participant', as: 'create_hub_participant'
  get 'participant_confirmation', to: 'pages#participant_confirmation'
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
