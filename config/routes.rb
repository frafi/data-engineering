DataEngineering::Application.routes.draw do

  resources :sales_imports, only: [:show, :new, :create]
  resource :user_session
  resource :account, controller: "users"
  resources :users
  root to: 'sales_imports#new'
end

