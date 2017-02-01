Rails.application.routes.draw do
  resources :facturas
  resources :orden_repuestos
  resources :chofers
  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'

  delete 'users/:id' => 'users#destroy'
  post 'users/:id' => 'users#approve'

  post 'prestamos/:id' => 'prestamos#approve'

  post 'vehiculos/:id' => 'vehiculos#devolver'

  # get 'vehiculos/:id' => 'vehiculos#historial'

  mount Judge::Engine => '/judge'

  resources :users, :only =>[:show]
  resources :prestamos

  devise_for :admins
  resources :orden_mantenimientos
  resources :orden_combustibles
  devise_for :users, :controllers => { registrations: 'registrations' }, :path_prefix => 'd'

  resources :vehiculos

  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
