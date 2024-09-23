Rails.application.routes.draw do
  resources :candidatos
  resources :candidaturas
  resources :empregadores
  resources :vagas
  resources :usuarios
  
  # Rotas para login e logout
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
