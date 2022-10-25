module RecursosHelper
	## ------------------------------------------------------- GENERAL

#	def app_setup
#		{
#			nombre: 'vi&v',
#			home_link: 'http://www.chinga.cl'
#		}
#	end

	def portada_setup
		{
			size: nil,
			clase: 'mx-auto d-block'
		}
	end

	def tema_home_setup
		{
            size: 'half',
            clase: 'mx-auto d-block',
            titulo_size: 1,
            titulo_color: 'secondary',
            detalle_size: 6,
            detalle_color: 'secondary'
		}
	end

	def foot_setup
		{
            size: 'quarter',
            clase: 'mx-auto d-block'
		}
	end

	def app_color
		{
			app: 'dark',
			navbar: 'dark',
			help: 'dark',
			data: 'success'
		}
	end

	## ------------------------------------------------------- TABLA | BTNS

	def sortable_fields
		{
			'controller' => ['campo1', 'campo2']
		}
	end

	# En modelo.html.erb define el tipo de tabla con la que se despliegan las tablas
	# <tr class="table-<%=tr_row(objeto)%>">
	# ex 'tr_row'
	def table_class(objeto)
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

	def app_alias_tabla(controller)
		controller
	end

	def app_new_button_conditions(controller)
		true
	end

	def app_crud_conditions(objeto, btn)
		case objeto.class.name
		when 'Elemento'
			usuario_signed_in? and objeto.perfil.id == session[:perfil_activo]['id'] and controller_name == 'contribuciones' and objeto.estado == 'publicada'
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

	def estados_conditions(objeto)
		false
	end

	def x_conditions(objeto, btn)
		case objeto.class.name
		when 'Lista'
			 ['elementos', 'equipos'].include?(controller_name)
		when 'Elemento'
			acceso = (usuario_signed_in? and objeto.perfil.id == session[:perfil_activo]['id'] and controller_name == 'contribuciones')
			if btn == 'Papelera'
				objeto.estado == 'publicada' and acceso
			elsif ['Eliminar', 'Publicar'].include?(btn)
				objeto.estado == 'papelera' and acceso
			end
		end
	end

	def x_btns(objeto)
		case objeto.class.name
		when 'Lista'
			[['Desclasificar', '/listas/desclasificar', true]]
		when 'Elemento'
			[
				['Publicar', '/publicar', true],
				['Papelera', '/papelera', true],
				['Eliminar', '/eliminar', true]
			]
        else
        	[]
		end		
	end

	def show_link_condition(objeto)
		true
	end

	## ------------------------------------------------------- SHOW

	# Método de apoyo usado en get_new_link (abajo)
	def app_show_title(objeto)
		case objeto.class.name
		when 'Elemento'
			objeto.titulo
		when 'Perfil'
			"| #{objeto.usuario.present? ? objeto.usuario : 'ingresar usuario'} | #{objeto.email} |"
		else
			objeto.send(objeto.class.name.tableize.singularize)
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
