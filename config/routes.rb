Rails.application.routes.draw do
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

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
