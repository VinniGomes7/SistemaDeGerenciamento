# config/routes.rb
Rails.application.routes.draw do
  root "home#index"

  # Recursos
  resources :candidatos
  resources :candidaturas
  resources :vagas
  resources :usuarios
  resources :empregadores
  
  # Rotas para login e logout
  get 'login', to: 'sessions#new', as: 'new_session'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end