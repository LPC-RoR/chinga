Rails.application.routes.draw do
  resources :administradores
  resources :clasificaciones
  resources :contribuciones
  resources :elementos do 
    match :estado, via: :get, on: :member
  end
  resources :equipos do
    match :nuevo, via: :post, on: :collection
    match :nueva_lista_equipo, via: :post, on: :collection
  end
  resources :evaluaciones
  resources :herencias
  resources :integrantes
  resources :lineas
  resources :listas do
    match :nuevo, via: :post, on: :collection
    match :agrega_elemento, via: :post, on: :collection
    match :desclasificar, via: :get, on: :member
  end
  resources :perfiles
  resources :textos
  resources :ultimas
  resources :vistas

  devise_for :usuarios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'vistas#index'

end
