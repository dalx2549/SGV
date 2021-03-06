Rails.application.routes.draw do



  #post 'prestamos/:id' => 'prestamos#add_chofer'

  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'

  delete 'users/:id' => 'users#destroy'

  #Obtiene la id del usuario seleccionado y la envía al método approve del controlador
  post 'users/:id' => 'users#approve'



  #Obtiene la id del vehículo seleccionado y la envía al método devolver del controlador
  #post 'vehiculos/:id' => 'vehiculos#devolver'

  # get 'vehiculos/:id' => 'vehiculos#historial'

  get :email_aprobado, to: 'prestamos#email_aprobado', as: :email_aprobado



  mount Judge::Engine => '/judge'

  #Resources provee GET, POST, PATCH/PUT(Update) y DELETE para el objeto indicado (Proporciona rutas para CRUD completo)

  put 'prestamos/:id' => 'prestamos#rechazar'

  resources :vehiculos
  resources :users, :only =>[:show]
  resources :prestamos
  resources :facturas
  resources :orden_repuestos
  resources :chofers
  resources :orden_mantenimientos
  resources :orden_combustibles


  devise_for :admins

  devise_for :users, :controllers => { registrations: 'registrations' }, :path_prefix => 'd'


  root 'static_pages#home'

  #Obtiene la id del prestamo seleccionado y la envía al método approve del controlador
  post 'prestamos/:id' => 'prestamos#approve'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
