module RecursosHelper

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

	def crud_conditions(objeto)
		case objeto.class.name
		when 'Carga'
			objeto.estado == 'ingreso'
		when 'Elemento'
			objeto.estado == 'ingreso'
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
			objeto.owner_id == session[:perfil_activo]['id'] or session[:es_administrador]
		end
	end

	def x_conditions(objeto, btn)
		case objeto.class.name
		when 'Carga'
			objeto.estado == 'ingreso'
		when 'Texto'
			controller_name == 'publicaciones'
		when 'Clasificacion'
			objeto.clasificacion != btn
		when 'Lista'
			 ['elementos', 'equipos'].include?(controller_name)
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
	def objeto_title(objeto)
		case objeto.class.name
		when 'Elemento'
			objeto.titulo
		when 'Perfil'
			"| #{objeto.usuario.present? ? objeto.usuario : 'ingresar usuario'} | #{objeto.email} |"
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
