DataEngineering::Application.routes.draw do

  resources :sales_imports, only: [:show, :new, :create]

  root to: 'sales_imports#new'

end
