Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games
  resources :game_sessions do
    resources :lobbies, only: [:new, :create, :destroy]
  end

  resources :lobbies, only: [:index]
end
