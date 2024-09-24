Rails.application.routes.draw do
  get 'home/index'
  resources :candidatos
  resources :candidaturas
  resources :vagas
  resources :usuarios
  resources :empregadores
  
  # Rotas para login e logout
  root "home#index"
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end