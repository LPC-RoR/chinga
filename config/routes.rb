Rails.application.routes.draw do
  resources :rutas
  resources :claves
  resources :forma_musicales
  resources :estructura_poeticas
  resources :parametros
  resources :genero_autores
  resources :observaciones
  resources :mejoras
  resources :registros
  resources :interpretes
  resources :creaciones
  resources :autores
  resources :soportes
  resources :participantes
  resources :ruedas
  resources :mensajes
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
  resources :perfiles do
    resources :listas
    match :activo, via: :get, on: :collection
  end
  resources :pasos
  resources :recursos do
    collection do
      match :inicia_sesion, via: :get
      match :tablas, via: :get
      match :manual, via: :get
    end
  end
  resources :tema_ayudas do
    resources :tutoriales
  end
  resources :textos
  resources :tutoriales do
    resources :pasos
  end
  resources :ultimas
  resources :vistas

  devise_for :usuarios, controllers: {
        confirmations: 'usuarios/confirmations',
#        omniauth_callbacks: 'usuarios/omniauth_callbacks',
        passwords: 'usuarios/passwords',
        registrations: 'usuarios/registrations',
        sessions: 'usuarios/sessions',
        unlocks: 'usuarios/unlocks'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recursos#home'

end
