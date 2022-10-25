module CapitanMenuHelper

	def optional_menu_item
		{
			recursos: false,
			contacto: true,
			ayuda: true
		}
	end

	def menu
	    ## Menu principal de la aplicación
	    # [ 'Item del menú', 'link', 'tipo_item' ]
	    [
	        ['Perfil',         "/perfiles/activo",    'usuario'],
	        ["Colección",      "/vistas",             'anonimo'],
	        ["Mis Contribuciones", "/contribuciones", 'usuario'],
	        ['Parámetros',      '/parametros',          'admin'],    
	        ["Administradores", "/administradores",     'admin'],
	        ["Estructuras",     "/ind_estructuras",       'dog']
	    ]

	end

	def menu_base
	    [
#	        ["Temas Ayuda",           "/tema_ayudas",                      'admin'],
	        ["Procesos",              "/recursos/procesos",                  'dog']
	    ]
	end

	def dropdown_items(item)
		case item
		when 'Investigación'
			[
#				['Líneas de Investigación', root_path],
#				['Investigadores Centro', root_path],
#				['Actividades Científicas Organizadas', root_path],
#				['Publicaciones', root_path],
#				['Propiedad Intelectual', root_path],
#				['Presentaciones Congresos', root_path],
#				['Premios y Honores', root_path]
			]
		end
	end

	def display_item_app(item, tipo_item)
		true
	end

end