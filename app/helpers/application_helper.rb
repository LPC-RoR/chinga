module ApplicationHelper
	## ------------------------------------------------------- HOME

	def img_class 
		{
			centrada: 'mx-auto d-block'
		}
	end

	def color(ref)
		if [:app, :navbar].include?(ref)
			app_color[ref]
		elsif ['hlp_tutoriales', 'hlp_pasos'].include?(ref)
			app_color[:help]
		else
			app_color[:app]
		end
	end

	def table_types_base
		{
			simple: '',
			striped: 'table-striped',
			bordered: 'table-bordered',
			borderless: 'table-borderless',
			hover: 'table-hover',
			small: 'table-small'
		}
	end

	def colors
		['primary', 'secondary', 'success', 'danger', 'warning', 'info', 'light', 'dark', 'muted', 'white']
	end

	def image_sizes
		['entire', 'half', 'quarter', 'thumb']
	end

	def foot?
		h_imagen = HImagen.find_by(nombre: 'Foot')
		h_imagen.blank? ? false : (h_imagen.imagenes.empty? ? false : h_imagen.imagenes.first.present?)
	end

	# DEPRECATED
	def objeto_tema_ayuda(tipo)
		TemaAyuda.where(tipo: tipo).any? ? TemaAyuda.where(tipo: tipo).first : nil
	end

	# DEPRECATED
	def coleccion_tema_ayuda(tipo)
		temas_ayuda_tipo = TemaAyuda.where(tipo: tipo)
		if temas_ayuda_tipo.any?
			temas_ayuda_activos = temas_ayuda_tipo.where(activo: true)
			temas_ayuda_activos.any? ? temas_ayuda_activos.order(:orden) : nil
		else
			nil
		end
	end

	## ------------------------------------------------------- SCOPES & PARTIALS

	def controllers_scope
		{
			aplicacion: ['app_administradores', 'app_nominas', 'app_perfiles', 'app_observaciones', 'app_mejoras', 'app_imagenes', 'app_contactos', 'app_mensajes', 'app_repos', 'app_directorios', 'app_documentos', 'app_archivos', 'app_enlaces', 'archivos', 'comentarios', 'directorios', 'documentos', 'imagenes', 'licencias', 'mejoras', 'observaciones', 'recursos', 'subs'],
			home:       ['h_temas', 'h_links', 'h_imagenes'],
			help:       ['conversaciones', 'mensajes', 'hlp_pasos', 'temaf_ayudas', 'hlp_tutoriales'],
			sidebar:    ['sb_listas', 'sb_elementos'],
			busqueda:   ['ind_clave_facetas', 'ind_claves', 'ind_indice_facetas', 'ind_indices', 'ind_palabras', 'ind_reglas', 'ind_sets'],
			estados:    ['st_modelos', 'st_estados'],
			data:       ['caracteristicas', 'caracterizaciones', 'columnas', 'datos', 'encabezados', 'etapas', 'lineas', 'opciones', 'tablas']
		}
	end

	def scope_controller(controller)
		if controllers_scope[:aplicacion].include?(controller)
			'aplicacion'
		elsif controllers_scope[:home].include?(controller)
			'home'
		elsif controllers_scope[:help].include?(controller)
			'help'
		elsif controllers_scope[:sidebar].include?(controller)
			'sidebar'
		elsif controllers_scope[:busqueda].include?(controller)
			'busqueda'
		elsif controllers_scope[:estados].include?(controller)
			'estados'
		elsif controllers_scope[:data].include?(controller)
			'data'
		else
			app_scope_controller(controller)
		end
	end

	## ------------------------------------------------------- MENU

	def nomenu_controllers
		['confirmations', 'mailer', 'passwords', 'registrations', 'sessions', 'unlocks']
	end

	# Obtiene los controladores que no despliegan menu
	def nomenu?(controller)
		nomenu_controllers.include?(controller)
	end

	def item_active(link)
		detalle_link = link.split('/')
		nombre_accion = (detalle_link.length == 2 ? 'index' : detalle_link[2])
		detalle_link[1] == controller_name and nombre_accion == action_name
	end

	def display_item_menu?(item, tipo_item)
		# SEGURIDADA PARA IEMS DE MENÚS
		if perfil? == true
			if ['dog', 'admin', 'anonimo'].include?(tipo_item)
				(usuario_signed_in? and seguridad_desde(tipo_item))
			elsif ['nomina', 'general'].include?(tipo_item)
				(usuario_signed_in? and seguridad_desde(tipo_item) and display_item_app(item, tipo_item))
			elsif tipo_item == 'excluir'
				false
			end
# DEPRECATED
#			when 'usuario'
#				usuario_signed_in? and display_item_app(item, tipo_item)
		else
			tipo_item == 'anonimo'
		end
	end

	def enlaces_generales
		AppEnlace.where(owner_id: nil).order(:descripcion)
	end

	def enlaces_perfil
		AppEnlace.where(owner_class: 'AppPerfil', owner_id: perfil_activo.id).order(:descripcion)
	end

	## ------------------------------------------------------- SIDEBAR + BANDEJA

	def base_sidebar_controllers
		[
			'sb_listas', 'sb_elementos',
			'app_recursos', 'app_administradores', 'app_nominas', 'app_perfiles', 'app_imagenes',
			'h_portadas', 'h_temas', 'h_links', 'h_imagenes',
			'hlp_tutoriales', 'hlp_pasos',
			'st_modelos', 'st_estados'
		]
	end

	def sidebar_controllers
		base_sidebar_controllers.union(app_sidebar_controllers)
	end

	def base_bandeja_controllers
#		StModelo.all.order(:st_modelo).map {|st_modelo| st_modelo.st_modelo.tableize}
		[]
	end

	def bandeja_controllers
		base_bandeja_controllers.union(app_bandeja_controllers)
	end

	def primer_estado(controller)
		st_modelo = StModelo.find_by(st_modelo: controller.classify)
		st_modelo.blank? ? nil : st_modelo.primer_estado.st_estado
	end

	def count_modelo_estado(modelo, estado)
		modelo.constantize.where(estado: estado).count == 0 ? '' : "(#{modelo.constantize.where(estado: estado).count})"
	end

	## ------------------------------------------------------- TABLA

	def table_types(controller)
		if ['app_directorios', 'app_documentos', 'app_archivos'].include?(controller)
			table_types_base[:borderless]
		else
			table_types_base[:striped]
		end
	end

	# Obtiene los campos a desplegar en la tabla desde el objeto
	def m_tabla_fields(objeto)
		objeto.class::TABLA_FIELDS
	end

	def inline_form?(controller)
		partial?(app_alias_tabla(controller), 'inline_nuevo')
	end

	# Objtiene LINK DEL BOTON NEW
	def get_new_link(controller)
		if inline_form?(controller)
			tipo_new = 'inline_form'
		else
			tipo_new = 'normal'
		end
		if tipo_new == 'normal'
			(app_alias_tabla(controller_name) == controller or @objeto.blank?) ? "/#{controller}/new" : "/#{@objeto.class.name.tableize}/#{@objeto.id}/#{controller}/new"
		end
	end

	def sortable?(controller, field)
		if sortable_fields[controller].present?
			sortable_fields[controller].include?(field) ? true : false
		else
			false
		end
	end

	def sortable(column, title = nil)
	  title ||= column.titleize
	  css_class = column == sort_column ? "current #{sort_direction}" : nil
	  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
	  link_to title, {:sort => column, :direction => direction, html_options: @options}, {:class => css_class}
	end

	## ------------------------------------------------------- TABLA | BTNS

	def new_button_conditions(controller)
		if ['app_administradores', 'app_nominas', 'hlp_tutoriales', 'hlp_pasos'].include?(controller)
				seguridad_desde('admin')
		elsif ['app_perfiles', 'usuarios', 'ind_palabras', 'app_contactos', 'app_directorios', 'app_documentos', 'app_archivos', 'app_enlaces'].include?(controller)
			false
		elsif ['app_mensajes'].include?(controller)
			action_name == 'index' and @e == 'ingreso'
		elsif ['sb_listas'].include?(controller)
				seguridad_desde('admin')
		elsif ['sb_elementos'].include?(controller)
				(@objeto.acceso == 'dog' ? dog? : seguridad_desde('admin'))
		elsif ['st_modelos'].include?(controller)
				dog?
		elsif ['st_estados'].include?(controller)
				seguridad_desde('admin')
		else
			app_new_button_conditions(controller)
		end
	end
	
	def crud_conditions(objeto, btn)
		if ['AppAdministrador', 'AppNomina', 'HlpTutorial', 'HlpPaso'].include?(objeto.class.name)
				seguridad_desde('admin')
		elsif ['AppPerfil', 'Usuario', 'AppMensaje' ].include?(objeto.class.name)
			false
		elsif ['SbLista', 'SbElemento'].include?(objeto.class.name)
			(usuario_signed_in? and seguridad_desde(objeto.acceso))
		elsif ['st_modelos'].include?(controller)
				dog?
		elsif ['st_estados'].include?(controller)
				seguridad_desde('admin')
		elsif ['AppObservacion', 'AppMejora'].include?(objeto.class.name)
			(usuario_signed_in? and objeto.perfil.id == current_usuario.id)
		else
			app_crud_conditions(objeto, btn)
		end
	end

	# Link de un x_btn del modelo de una tabla
	# objeto : objeto del detalle de la tabla
	# accion : url al que hay que sumarle los parámetros}
	# objeto_ref : true => se incluyen parámetros de @objeto
	def link_x_btn(objeto, accion, objeto_ref)
		ruta_raiz = "/#{objeto.class.name.tableize}/#{objeto.id}#{accion}"
		ruta_objeto = (objeto_ref and @objeto.present?) ? "#{(!!accion.match(/\?+/) ? '&' : '?')}class_name=#{@objeto.class.name}&objeto_id=#{@objeto.id}" : ''
		"#{ruta_raiz}#{ruta_objeto}"
	end

	# pregunta si tiene childs
	# "_btns_e.html.erb"
	def has_child?(objeto)
		# Considera TODO, hasta los has_many through
		objeto.class.reflect_on_all_associations(:has_many).map { |a| objeto.send(a.name).any? }.include?(true)
	end

	## ------------------------------------------------------- FORM
	# Este helper pergunta si hay un partial con un nombre particular en el directorio del controlador
	def partial?(controller, partial)
		File.exist?("app/views/#{(scope_controller(controller).blank? ? '' : "#{scope_controller(controller)}/")}#{controller}/_#{partial}.html.erb")
	end

	def get_partial(controller, partial)
		"#{(scope_controller(controller).blank? ? '' : "#{scope_controller(controller)}/")}#{controller}/#{partial}"
	end

	# Este helper encuentra el partial que se debe desplegar como form
	# originalmente todos llegaban a _form
	# ahora pregunta si hay un partial llamado _datail en el directorio de las vistas del modelo
	def detail_partial(controller)
		if partial?(controller, 'detail')
			get_partial(controller, 'detail')
		else
			'0p/form/detail'
		end
	end

	def url_params(parametros)
		params_options = "n_params=#{parametros.length}"
		parametros.each_with_index do |obj, indice|
			params_options = params_options+"&class_name#{indice+1}=#{obj.class.name}&obj_id#{indice+1}=#{obj.id}"
		end
		params_options
	end

	## -------------------------------------------------------- TABLA & SHOW

	# obtiene el nombre del campo puro desde la descripción de TABLA_FIELDS
	def get_field_name(label)
		label.split(':').last.split('#').last
	end

	# Obtiene el campo para despleagar en una TABLA
	# Acepta los sigueintes labels:
	# 1.- archivo:campo : archivo es un campo has_one o belongs_to y campo es el nombre del campo de esa relación
	# 2.- campo : campo es el campo del objeto
	# 3.- i#campo : es un campo que va antecedido de un ícono
	# Resuelve BT_FIELDS y d_<campo> si es necesario 
	def get_field(label, objeto)
		#Debe resolver archivo:k*#campo
		# [archivo, archivo, campo]

		# Variables de la función
		v = label.split(':')               # vector de palabras en label
		archivos = v.slice(0, v.length-1)  # vector que tienen todos los archivos
		nombre = v.last                    # nombre del campo

		# se avanza por los archivos hasta el último
		archivo = objeto
		archivos.each do |arch|
			archivo = archivo.send(arch)
		end

		v_nombre = nombre.split('#')
		campo = v_nombre.last
		prefijos = v_nombre - [v_nombre.last]

		unless archivo.send(campo).blank?
			if ['DateTime', 'Time'].include?(archivo.send(campo).class.name)
				texto_campo = archivo.send(campo).strftime("%d-%m-%Y")
			elsif prefijos.include?('uf') 
				texto_campo = number_to_currency(archivo.send(campo), unit: 'UF', precision: 2, format: '%u %n')
			elsif prefijos.include?('$')
				texto_campo = number_to_currency(archivo.send(campo), precision: 0, unit: '$', format: '%u %n')
			else
				texto_campo = archivo.send(campo)
			end
			[texto_campo, prefijos]
#			[(['DateTime', 'Time'].include?(archivo.send(campo).class.name) ? archivo.send(campo).strftime("%d-%m-%Y") : archivo.send(campo)), prefijos]
		else
			nil
		end

	end

	## ------------------------------------------------------- SHOW

	def show_title(objeto)
		case objeto.class.name
		when 'SbLista'
			objeto.lista
		when 'SbElemento'
			objeto.elemento
		when 'HlpTutorial'
			objeto.tutorial
		else
			app_show_title(objeto)
		end
	end

	def status?(objeto)
		partial?(controller, 'status')
	end

	## ------------------------------------------------------- GENERAL

	# Manejode options para selectors múltiples
	def get_html_opts(options, label, value)
		opts = options.clone
		opts[label] = value
		opts
	end

	## ------------------------------------------------------- LIST

	def text_with_badge(text, badge_value=nil)
	    badge = content_tag :span, badge_value, class: 'badge badge-primary badge-pill'
	    text = raw "#{text} #{badge}" if badge_value
	    return text
	end

	## ------------------------------------------------------- PUBLICACION

	def get_evaluacion_publicacion(publicacion, item)
		e = perfil_activo.evaluaciones.find_by(aspecto: item, publicacion_id: publicacion.id)
		e.blank? ? '[no evaluado]' : e.evaluacion
	end

	def get_btns_evaluacion(publicacion, item)
		eval_actual = publicacion.evaluaciones.find_by(aspecto: item)
		excluido = eval_actual.blank? ? [] : [eval_actual.evaluacion]
		Publicacion::EVALUACION[item] - excluido
	end

end
