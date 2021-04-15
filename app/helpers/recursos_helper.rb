	module RecursosHelper
	## ------------------------------------------------------- MENU

	def menu
	    ## Menu principal de la aplicación
	    # [0] : Item del menú
	    # [1] : Link del ítem
	    # [2] : Tipo de ítem {'admin', 'usuario', 'anonimo', 'excluir'}
	    # se usa directamente en 0p/navbar/_navbar.html.erb
	    [
	        ['Perfil',         "/perfiles/activo",    'usuario'],
	        ["Colección",      "/vistas",             'anonimo'],
	        ["Mis Contribuciones", "/contribuciones", 'usuario'],
	#        ["Equipos",        "/equipos",         'usuario'],
	#        ["Listas",         "/listas",          'usuario'],
	        ['Parámetros',      '/parametros',          'admin'],    
	        ["Administradores", "/administradores",     'admin'],
	        ["Temas Ayuda",     "/tema_ayudas",         'admin'] 
	    ]
	end

	def display_item_app(item, tipo_item)
		true
	end

	## ------------------------------------------------------- TABLA | BTNS

	def tr_row(objeto)
		case objeto.class.name
		when 'Publicacion'
			if usuario_signed_in?
				'default'
			else
				'default'
			end
		else
			'default'
		end
	end

	def crud_conditions(objeto, btn)
		case objeto.class.name
		when 'Elemento'
			usuario_signed_in? and objeto.perfil.id == session[:perfil_activo]['id'] and objeto.estado == 'ingreso'
		when 'Lista'
			controller_name == 'perfiles'
		when 'Texto'
			false
		when 'Clasificacion'
			false
		when 'GeneroAutor'
			objeto.owner_id == session[:perfil_activo]['id'] or session[:es_administrador]
		when 'FormaMusical'
			objeto.owner_id == session[:perfil_activo]['id'] or session[:es_administrador]
		when 'EstructuraPoetica'
			objeto.owner_id == session[:perfil_activo]['id'] or session[:es_administrador]
		when 'Soporte'
			usuario_signed_in? and (objeto.owner_id == session[:perfil_activo]['id'] or session[:es_administrador])
		else
			['TemaAyuda', 'Tutorial', 'Paso'].include?(objeto.class.name) ? (usuario_signed_in? ? session[:es_administrador] : false) : true
		end
	end

	def x_conditions(objeto, btn)
		case objeto.class.name
		when 'Lista'
			 ['elementos', 'equipos'].include?(controller_name)
		end
	end

	def x_btns(objeto)
		case objeto.class.name
		when 'Lista'
			[['Desclasificar', '/listas/', '/desclasificar', true]]
        else
        	[]
		end		
	end

	def show_link_condition(objeto)
		true
	end

	## ------------------------------------------------------- FORM & SHOW

	def detail_controller_path(controller)
		if ['elementos', 'soportes'].include?(controller)
			"#{controller}/detail"
		else
			'0p/form/detail'
		end
	end

	# apoyo de filtro_condicional_field? (abajo)
	def get_field_condition(objeto, field)
		case objeto.class.name
		when 'Elemento'
			true
		when 'Mensaje'
			field != 'email' or not usuario_signed_in?
		end
	end

	## ------------------------------------------------------- SHOW

	# Método de apoyo usado en get_new_link (abajo)
	def show_title(objeto)
		case objeto.class.name
		when 'Elemento'
			objeto.titulo
		when 'Perfil'
			"| #{objeto.usuario.present? ? objeto.usuario : 'ingresar usuario'} | #{objeto.email} |"
		else
			objeto.send(objeto.class.name.downcase)
		end
	end

	def show_links(objeto)
		case objeto.class.name
		when 'Elemento'
			[
				['Editar',     [:edit, objeto], objeto.estado == 'ingreso'],
				['Papelera',   "/elementos/#{objeto.id}/estado?estado=papelera",     (['ingreso', 'duplicado'].include?(objeto.estado) and objeto.listas.any?) ],
				['Eliminar',   "/elementos/#{objeto.id}/estado?estado=eliminado",    (['ingreso', 'papelera'].include?(objeto.estado) and objeto.listas.empty?)],
				['Publicar',   "/elementos/#{objeto.id}/estado?estado=publicada",    (['ingreso'].include?(objeto.estado) and objeto.titulo.present? and objeto.autor.present? and objeto.letra.present?)],	
				['Ingreso',    "/elementos/#{objeto.id}/estado?estado=ingreso",      ['publicado', 'papelera'].include?(objeto.estado) ],
				['Múltiple',   "/elementos/estado?elemento_id=#{objeto.id}&estado=multiple",     objeto.estado == 'duplicado'],
				['Corrección', "/elementos/#{objeto.id}/estado?estado=correccion",   (objeto.estado == 'publicada' and usuario_signed_in? and objeto.perfil.id == session[:perfil_activo]['id']) ]
			]
		end
	end

end
