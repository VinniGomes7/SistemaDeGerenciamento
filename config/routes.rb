Rails.application.routes.draw do
  resources :candidatos
  resources :candidaturas
  resources :vagas
  resources :usuarios
  resources :empregadores
  
  # Rotas para login e logout
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end