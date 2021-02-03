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
    ## ------------------------------------------------- MENU
    # controladores que NO despliegan MENU
    # se usa en nomenu?
    config.x.menu.exceptions_controllers = ['confirmations', 'mailer', 'passwords', 'registrations', 'sessions', 'unlocks']    

    ## Menu principal de la aplicación
    # [0] : Item del menú
    # [1] : Link del ítem
    # [2] : Tipo de ítem {'admin', 'usuario', 'anonimo', 'excluir'}
    # se usa directamente en 0p/navbar/_navbar.html.erb

    config.menu = [
        ["Coleccion",      "/vistas",            'anonimo'],
        ["Contribuciones", "/contribuciones",    'usuario'],
        ["Equipos",        "/equipos",           'usuario'],
        ["Listas",         "/listas",            'usuario'],
        ["Administradores","/administradores",     'admin']
    ]

    ## ------------------------------------------------- FRAMES
    config.frames = {
        'vistas' => {
            'escritorio' => {
                titulo: 'Escritorio',
                selector: 'Carpetas',
                action_type: 'tabla'
            }

        },
        'revisiones' => {
            'index' => {
                titulo: 'Revisión de Citas',
                selector: 'Áreas',
                tabs: ['Cargas', 'Contribuciones', 'Formatos', 'Duplicados', 'Papelera'],
                action_type: 'tabla'
            }
        },
        'contribuciones' => {
            'index' => {
                titulo: 'Contribución de Citas',
                action_type: 'tabla'
            }
        }
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
            tabs: ['ingreso', 'papelera']
        },
#        'carpetas'        => {
#            elementos: {
#                nuevo:    ['equipos']
#            }
#        },
        'equipos'     => {
            elementos: {
                tabs:    ['self']
            },
            tabs: ['Administrados', 'Participaciones'],
            new_type: {
                #'controller' => 'tipo_new'
                # '*' en todo controller_name
                '*' => 'inline'
            }
        }
    }

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
        'Carga'         => {
            conditions: ['x', 'crud'],
            x_btns: [   
                ['Proceso', '/cargas/', '/procesa_carga', false]
            ]
        },
        'Area'         => {
            conditions: ['crud']
        },
        'Equipo'       => {
            x_btns: [
                ['Eliminar', '/equipos/', '/elimina_equipo', true]
            ]
        },
        'Instancia'    => {
            conditions: ['x', 'crud'],
            x_btns: [
                ['Eliminar', '/instancias/', '/elimina_instancia', true]
            ]
        }
    }

    ## ------------------------------------------------- FORM

    # estan condiciones se aplican a FORM y SHOW
    config.x.form.exceptions = {
        'Elemento' => {
            f_detail: true,
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
        }
    }

    ## ------------------------------------------------- SHOW

    config.x.show.exceptions = {
        'Elemento' => {
            elementos: [:clasifica, :tabla, :inline_form, 'show_title'],
        },
        'Equipo'     => {
            elementos: [:detalle, :inline_form]
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
