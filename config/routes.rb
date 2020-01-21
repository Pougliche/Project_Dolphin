Rails.application.routes.draw do
  devise_for :users
  resources :conversations do
    resources :messages
  end 
  root 'home_page#index'
  resources :events do
    resources :attendances, only: [:create, :destroy]
  end
  resources :games do
    resources :game_playeds, only: [:create, :destroy]
  end
  resources :home_page
end
