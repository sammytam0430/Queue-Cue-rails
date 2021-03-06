Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '*all', to: 'application#preflight', :via => [:options]
  resources :restaurants
  resources :customers
  resources :reservations
  get '/*path' => redirect('/')
end
