Rails.application.routes.draw do
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


  get 'reunion/template_pdf', to: 'reunions#template_pdf', as:'imprimir_template'


  get 'dashboard', to: 'punto_venta#dashboard', as:'punto_venta_dashboard'

  post "/personas/buscar_persona_completa/:cuit", to: 'personas#buscar_persona_completa'
  post "/personas/buscar_persona/:cuit", to: 'personas#buscar_persona',  as: :buscar_persona


  get "/punto_ventum/select", to: 'punto_venta#select',  as: :select_punto_venta

  get "/concesionarium/select", to: 'concesionaria#select',  as: :select_concesionaria

  root 'home#index'

  get "/home_vendedor", to: 'vendedors#home',  as: :home_vendedor

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
