Rails.application.routes.draw do
  resources :estados
  resources :estado_personas
  resources :persona_punto_venta
  resources :persona_concesionaria
  resources :objetivo_mensuals
  resources :objetivo_semanals
  resources :carga_diaria
  resources :tipo_objetivos
  resources :reunion_participantes
  resources :reunions
  resources :user_punto_venta
  resources :objetivos
  resources :tipo_indicadors
  resources :indicadors
  resources :concesionaria
  resources :punto_venta
  resources :equipos
  resources :vendedors
  resources :personas
  resources :tipo_documentos
  devise_for :users

  get 'home/index'
  
  get 'admin', to: 'home#admin', as:'admin_index'

  get 'dashboard', to: 'punto_venta#dashboard', as:'punto_venta_dashboard'

  post "/personas/buscar_persona_completa/:cuit", to: 'personas#buscar_persona_completa'

  post "/personas/buscar_persona/:cuit", to: 'personas#buscar_persona',  as: :buscar_persona

  get "/persona/persona_concesionaria", to: 'personas#new_persona_concesionaria',  as: :new_persona_concesionaria

  get "/persona/persona_punto_venta", to: 'personas#new_persona_punto_venta',  as: :new_persona_punto_venta

  get "/persona/new_administrador", to: 'personas#new_administrador',  as: :new_administrador

  get "/persona/edit_administrador", to: 'personas#edit_administrador',  as: :edit_administrador

  get "/persona/administradores", to: 'personas#administradores',  as: :administradores

  get "/punto_ventum/select", to: 'punto_venta#select',  as: :select_punto_venta

  get "/concesionarium/select", to: 'concesionaria#select',  as: :select_concesionaria

  get "/estado_persona/select", to: 'estado_persona#select',  as: :select_estado_persona

  root 'home#index'

  get "/home_vendedor", to: 'vendedors#home',  as: :home_vendedor

  get "/objetivos_y_carga_diaria", to: 'vendedors#objetivos_y_carga_diaria',  as: :objetivos_y_carga_diaria

  get "/persona/cambiar_contrasenia/:id", to: 'personas#cambiar_contrasenia',  as: :persona_cambiar_contrasenia

  get "/reunionsm.pdf", to: 'reunions#reunion_mensual', as: :reunion_mensual

  get "/vendedor/cambiar_rol", to: 'vendedors#cambiar_rol', as: :vendedor_cambiar_rol

  post "/objetivo_mensuals/actualizar_objetivos" , to: 'objetivo_mensuals#actualizar_objetivos', as: :actualizar_objetivos

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
