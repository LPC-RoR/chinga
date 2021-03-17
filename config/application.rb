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

    # Se verifica con el helper in_show?(c, label)
    config.s_default = {
        titulo:       true,
        links:        true,
        clasifica:   false,
        detalle:     false,
        inline_form: false,
        tabla:        true,
        adjuntos:    false
    }

    ## ------------------------------------------------- APARIENCIA APLICACION

    config.look_app = {
        'aplicacion' => {
            favicon: true,
            banner: false,
            nombre: 'vi&v',
            home_link: 'http://www.chinga.cl',
            imagen_portada: true,
            titulo_size: '1',
            titulo_color: 'secondary',
            detalle_size: '6',
            detalle_color: 'secondary',
            foot_size: 'quarter'
        },
        'navbar' => {
            color: 'dark',
            logo: true
        },
        'look_elementos' => {
            'app' => {
                color: 'dark'
            },
            'help' => {
                color: 'secondary',
                controllers: ['tema_ayudas', 'tutoriales', 'pasos', 'mensajes']
            },
            'data' => {
                color: 'success',
                controllers: ['etapas', 'tablas', 'lineas', 'especificaciones', 'observaciones', 'archivos', 'imagenes']
            }
        }
    }

    ## ------------------------------------------------- MENU

    config.menu = {
        nomenu_controllers: ['confirmations', 'mailer', 'passwords', 'registrations', 'sessions', 'unlocks'],
        add_contacto: true,
        add_ayuda: true
    }

    ## ------------------------------------------------- TABLA

    config.x.tables.bt_fields = {
        'Modelo' => {
            'field' => ['field_type', 'bt_object']
        },
        'Equipo' => {
            'email' => ['bt_field', 'administrador']
        }
    }

    config.x.tables.exceptions = {
        'elementos' => {
            elementos: {
                tabs:  ['self', 'contribuciones'],
                paginas: ['*'],
                nuevo:   ['self', 'contribuciones']
            },
            tabs: {
                'contribuciones' => ['ingreso', 'publicada', 'papelera']
            }
        },
#        'carpetas'        => {
#            elementos: {
#                nuevo:    ['equipos']
#            }
#        },
        'equipos'     => {
            elementos: {
                tabs:    ['perfiles'],
                nuevo: ['perfiles']
            },
            tabs: {
                'perfiles' => ['Administrados', 'Participaciones']
            },
            new_type: {
                #'controller' => 'tipo_new'
                # '*' en todo controller_name
                '*' => 'inline'
            }
        }
    }

    config.alias_controllers = {
        'vistas'         => 'elementos',
        'contribuciones' => 'elementos'
    }

    config.sortable_tables = {}

    ## ------------------------------------------------- TABLA | BTNS

    ## x_btns
    # [0] : Nombre del boton
    # [1] : link base, a esta base se le agrega el instancia_id
    # [2] : Si es true se agrega "objeto_id=#{@objeto.id}"

    config.x.btns.exceptions = {
        'Elemento'   => {
            conditions: ['crud']
        },
        'Lista'       => {
            conditions: ['crud', 'x'],
            x_btns: [
                ['Desclasificar', '/listas/', '/desclasificar', true]
            ]
        },
        'Equipo'       => {
            x_btns: [
                ['Eliminar', '/equipos/', '/elimina_equipo', true]
            ]
        },
        'GeneroAutor' => {
            conditions: ['crud']
        },
        'FormaMusical' => {
            conditions: ['crud']
        },
        'EstructuraPoeticag' => {
            conditions: ['crud']
        },
        'Soporte' => {
            conditions: ['crud']
        },
    }

    ## ------------------------------------------------- FORM

    config.detail_types_controller = {
        dependencias: ['mejoras', 'mensajes', 'observaciones', 'tema_ayudas', 'tutoriales', 'pasos'],
        modelo: ['elementos']
    }

    # estan condiciones se aplican a FORM y SHOW
    config.x.form.exceptions = {
        'Elemento' => {
            conditional_fields: [
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
            ]
        },
        'Mensaje' => {
            conditional_fields: ['email']
        },
    }

    ## ------------------------------------------------- SHOW

    config.x.show.exceptions = {
        'Elemento' => {
            elementos: [:clasifica, :tabla, :inline_form, 'show_title'],
        },
        'Equipo'     => {
            elementos: [:detalle, :inline_form]
        },
        'Perfil' => {
            elementos: ['show_title']
        }
    }

    config.x.show.links = {
        links:     ['Elemento'],
        bt_links:  ['Publicacion'],
        hmt_links: ['Publicacion'],
        bt_objects: {
            'Publicacion' => ['revista']
        },
        hmt_collections: {
            'Publicacion' => ['investigadores']
        }
    }


    config.x.show.hidden = {
        'publicaciones'  => ['autores', 'investigadores', 'procesos', 'cargas', 'clasificaciones', 'carpetas', 'evaluaciones', 'asignaciones', 'areas', 'rutas', 'instancias'],
        'carpetas'       => ['clasificaciones'],
        'investigadores' => ['autores', 'carpetas'],
        'equipos'        => ['investigadores', 'instancias', 'integrantes', 'herencias'],
        'areas'          => ['clasificaciones', 'cargas'],
        'conceptos'      => ['rel_hijos'],
        'instancias'     => ['rutas']
    }

  end
end
