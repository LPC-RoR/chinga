require_relative 'boot'

require 'rails/all' 

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Chinga
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # +++ HCH activa locala :es
    config.i18n.default_locale = :es

    ## ------------------------------------------------- CAPITAN

    ## ------------------------------------------------- STANDARD

    ## comportamiento por defecto de los elementos de una tabla
    # Se verifica con el helper in_t?(c, label)
    config.t_default = {
        titulo:  {'self' => true,  'show' => false},
        tabs:    {'self' => false, 'show' => false}, 
        estados: {'self' => false, 'show' => false},
        paginas: {'self' => false, 'show' => false},
        nuevo:   {'self' => true,  'show' => false}
    }

    config.look_parameters = {
        image_sizes: ['entire', 'half', 'quarter', 'thumb'],
        colors: ['primary', 'secondary', 'success', 'danger', 'warning', 'info', 'light', 'dark', 'muted', 'white']
    }

    ## ------------------------------------------------- APARIENCIA APLICACION

    config.look_app = {
        aplicacion: {
            favicon: true,
            banner: false,
            nombre_aplicacion: 'vi&v',
            home_link: 'http://www.chinga.cl',
            portada: {
                active: true,
                size: nil,
                clase: 'mx-auto d-block'
            },
            init: {
                size: 'half',
                clase: 'mx-auto d-block',
                titulo_size: 1,
                titulo_color: 'secondary',
                detalle_size: 6,
                detalle_color: 'secondary'
            },
            foot: {
                active: true,
                size: 'quarter',
                clase: 'mx-auto d-block'
            },
            help: {
                size: 'quarter',
                clase: 'mx-auto d-block'
            }
        },
        navbar: {
            color: 'dark',
            logo: true,
            nomenu_controllers: ['confirmations', 'mailer', 'passwords', 'registrations', 'sessions', 'unlocks'],
            item_contacto: true,
            item_ayuda: true
        },
        look_elementos: {
            app: {
                color: 'dark'
            },
            help: {
                color: 'secondary',
                controllers: ['tema_ayudas', 'tutoriales', 'pasos', 'mensajes']
            },
            data: {
                color: 'secondary',
                controllers: ['etapas', 'tablas', 'lineas', 'especificaciones', 'observaciones', 'archivos', 'imagenes']
            }
        }
    }

    ## ------------------------------------------------- TABLA

    config.tables = {
        exceptions: {
            titulo: {
#                'areas' => ['rutas'],
            },
            estados: {},
            tabs: {
                'elementos' => ['self', 'contribuciones'],
                'equipos' => ['perfiles']
            },
            paginas: {
                'elementos' => ['*']
            },
            nuevo: {
                'elementos' => ['contribuciones'],
                'equipos' => ['perfiles']
            },
            inline_form: {
                'equipos' => ['*']
            }
        },
        tabs: {
            'elementos' => {
                'contribuciones' => ['publicada', 'papelera']
            },
            'equipos' => {
                'perfiles' => ['Administrados', 'Participaciones']
            }
        },
        bt_fields: {
            'Equipo' => {
                'email' => 'administrador'
            }
        },
        alias: {
            'vistas' => 'elementos',
            'contribuciones' => 'elementos'
        },
        sortable: {
#            'publicaciones' => ['author', 'title', 'doc_type', 'year']
        }
    }

    ## ------------------------------------------------- FORM

    config.form = {
        conditional_fields: {
            'Elemento' => [
                'titulo',
                'letra',
                'autor',
                'genero',
                'ciudad_autor',
                'pais',
                'interprete',
                'disco',
                'link',
                'forma_musical',
                'annio_creacion',
                'annio_estreno',
                'otro_soporte'
            ],
            'Mensaje' => ['email']
        }
    }

    config.detail_types_controller = {
        help: ['mejoras', 'mensajes', 'observaciones', 'tema_ayudas', 'tutoriales', 'pasos'],
        data: ['especificaciones', 'tablas'],
        modelo: ['elementos']
    }

    ## ------------------------------------------------- SHOW

    config.show = {
        partial_links: [],
        links: ['Elemento'],
        bt_links: {
#            'Publicacion' => ['revista']
        },
        hmt_links: {
#            'Publicacion' => ['investigadores']
        },
        status: ['Equipo']
    }

  end
end
