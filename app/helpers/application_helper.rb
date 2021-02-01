module ApplicationHelper
	## USO GENERAL

	## CAPITAN

	## ------------------------------------------------------- MENU

	# Obtiene los controladores que no despliegan menu
	def nomenu?(controller)
		Rails.configuration.x.menu.exceptions_controllers.include?(controller)
	end

	def menu
		Rails.configuration.menu
	end

	def item_active(link)
		detalle_link = link.split('/')
		nombre_accion = (detalle_link.length == 2 ? 'index' : detalle_link[2])
		detalle_link[1] == controller_name and nombre_accion == action_name
	end

	def display_item_menu?(tipo_item)
		# ITEMS de MENU sólo para USUARIOS REGISTRADOS
		case tipo_item
		when 'admin'
			(usuario_signed_in? and session[:es_administrador] == true)
		when 'usuario'
			usuario_signed_in?
		when 'anonimo'
			true
		when 'excluir'
			false
		end
	end

	## ------------------------------------------------------- FRAME

	def frame_titulo(controlador, accion)
		Rails.configuration.frames[controlador][accion][:titulo]
	end

	# "_frame.html.erb" y "_bi_frame.html.erb"
	def frame_with_tabs?(controlador, accion)
		Rails.configuration.frames[controlador][accion][:tabs].present?
	end

	# Obtiene TABS de un controller + action
	def frame_tabs(controlador, accion)
		Rails.configuration.frames[controlador][accion][:tabs]
	end

	# "_frame.html.erb" y "_bi_frame.html.erb"
	def frame_with_table?(controlador, accion)
		Rails.configuration.frames[controlador][accion][:action_type] == 'tabla'
	end

	def bi_frame_selector(controlador, accion)
#		controlador.classify.constantize::FRAME_SELECTOR[accion]
		Rails.configuration.frames[controlador][accion][:selector]
	end

	## ------------------------------------------------------- TABLA

	# valida el uso de alias en las tablas
	def alias_tabla(controlador)
		case controlador
		when 'papers'
			'publicaciones'
		when 'hijos'
			'conceptos'
		when 'ingresos'
			'publicaciones'
		else
			controlador
		end
	end

	# Maneja comportamiento por defecto y excepciones de TABLA
	def in_t?(controlador, label)
		excepcion = false
		# Pregunta si el Controlador TIENE personalizacion
		if Rails.configuration.x.tables.exceptions[controlador].present?
			if Rails.configuration.x.tables.exceptions[controlador][:elementos][label].present?
				elementos_label = Rails.configuration.x.tables.exceptions[controlador][:elementos][label]
				# self  = true : está en el mismo controlador, con accion 'index' y se marcó 'self' como excepción
				excepcion_self       = (controller_name == controlador and action_name == 'index' and elementos_label.include?('self'))
				# *     = true
				excepcion_todo       = (elementos_label.include?('*'))
				# label = true
				excepcion_controller = (elementos_label.include?(controller_name))

				excepcion = (excepcion_self or excepcion_todo or excepcion_controller)

			end 
		end 
		de = (controller_name == controlador and action_name == 'index') ? Rails.configuration.t_default[label]['self'] : Rails.configuration.t_default[label]['show']

		(excepcion ? (not de) : de)
	end

	def inline_form?(controlador)
		if Rails.configuration.x.tables.exceptions[controlador].present?
			if Rails.configuration.x.tables.exceptions[controlador][:new_type].present?
				inline_todos       = Rails.configuration.x.tables.exceptions[controlador][:new_type]['*'] == 'inline'
				inline_controller  = Rails.configuration.x.tables.exceptions[controlador][:new_type][controlador] == 'inline'
				inline_todos or inline_controller
			else
				false
			end
		else
			false
		end
	end

	# Método de apoyo usado en get_new_link (abajo)
	def f_controller(controller)
		case controller
		when 'ingresos'
			'publicaciones'
		else
			controller
		end
	end

	# Objtiene LINK DEL BOTON NEWf
	def get_new_link(controller)
		# CONTROLA EXCEPCIONES
		if Rails.configuration.x.tables.exceptions[controller].present?
			if Rails.configuration.x.tables.exceptions[controller][:new_type].present?
				if Rails.configuration.x.tables.exceptions[controller][:new_type]['*'].present?
					tipo_new = Rails.configuration.x.tables.exceptions[controller][:new_type]['*']
				elsif Rails.configuration.x.tables.exceptions[controller][:new_type]['self'].present? and controller_name == controller
					tipo_new = Rails.configuration.x.tables.exceptions[controller][:new_type]['self']
				elsif Rails.configuration.x.tables.exceptions[controller][:new_type][controller_name].present?
					tipo_new = Rails.configuration.x.tables.exceptions[controller][:new_type][controller_name]
				else
					tipo_new = 'normal'
				end
			else
				tipo_new = 'normal'
			end
		else
			tipo_new = 'normal'
		end

		# GENERA EL LINK
		case tipo_new
		when 'mask'
			"/#{controller}/mask_new?origen=#{controller_name}"
		# TIPO_NEW = 'child_nuevo'
		# {'pedidos'}
		when 'child_nuevo'
			"/#{controller}/nuevo?#{@objeto.class.name.downcase}_id=#{@objeto.id}"
		# TIPO_NEW = 'child_sel' : seleccion ? parametro_padre
		# {'empleados', 'productos', 'clientes(*)'}
		when 'child_sel'
			# TIPO_NEW = 'child_sel'
			# TABLA_SEL = 'controller'
			"/#{controller.classify.constantize::TABLA_SEL}/seleccion?#{@objeto.class.name.downcase}_id=#{@objeto.id}"
		# TIPO_NEW = 'detalle_pedido' : seleccion ? parametro_padre & empresa
		# {'empleados', 'productos', 'clientes(*)'}
		when 'detalle_pedido'
			"/#{controller.classify.constantize::SELECTOR}/seleccion?#{@objeto.class.name.downcase}_id=#{@objeto.id}&empresa_id=#{@objeto.registro.empresa.id}"
		when 'normal'
			f_controller(controller_name) == controller ? "/#{controller}/new" : "/#{@objeto.class.name.tableize}/#{@objeto.id}/#{controller}/new"
		end
	end

	# Obtiene el campo para despleagar en una TABLA
	# Resuelve BT_FIELDS y d_<campo> si es necesario 
	def get_field(name, objeto)
		if objeto.class::column_names.include?(name) or (name.split('_')[0] == 'd') or (name.split('_')[0] == 'm')
			objeto.send(name)
		elsif Rails.configuration.x.tables.bt_fields[objeto.class.name].present?
			if Rails.configuration.x.tables.bt_fields[objeto.class.name][name][0] == 'bt_field'
				obj_base = objeto.send(Rails.configuration.x.tables.bt_fields[objeto.class.name][name][1])
				(obj_base.blank? ? ' objeto NO encotrado ' : obj_base.send(name))
			else
				objeto.send(name)
			end
		else
			'FieldNotFound'
		end
	end

	# Obtiene los campos a desplegar en la tabla desde el objeto
	def m_tabla_fields(objeto)
		objeto.class::TABLA_FIELDS
	end

	# Obtiene los TABS de un modelo usando el controlador
	# "-tabla.html.erb"
	def c_tabs(controller)
		Rails.configuration.x.tables.exceptions[controller][:tabs]
	end

	# Obtiene los estados de un modelo usando el controlador
	# "-tabla.html.erb"
	def c_estados(controller)
		Rails.configuration.x.tables.exceptions[controller][:estados]
	end

	## ------------------------------------------------------- TABLA | BTNS

	def crud_conditions(objeto)
		case objeto.class.name
		when 'Carga'
			objeto.estado == 'ingreso'
		when 'Publicacion'
			objeto.origen == 'ingreso'
		when 'Carpeta'
			not Carpeta::NOT_MODIFY.include?(objeto.carpeta)
		when 'Texto'
			false
		when 'Clasificacion'
			false
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
		end
	end

	def btns?(objeto, tipo)
		if Rails.configuration.x.btns.exceptions[objeto.class.name].present?
			if Rails.configuration.x.btns.exceptions[objeto.class.name][:conditions].present?
				case tipo
				when 'crud'
					Rails.configuration.x.btns.exceptions[objeto.class.name][:conditions].include?('crud') ? crud_conditions(objeto) : true
				when 'x'
					Rails.configuration.x.btns.exceptions[objeto.class.name][:conditions].include?('x')
				end
			else
				tipo == 'crud' ? true : false
			end
		else
			# por defecto 'crud' es true y 'x' es false
			tipo == 'crud' ? true : false
		end
	end

	def x_btns(objeto)
		Rails.configuration.x.btns.exceptions[objeto.class.name][:x_btns]
	end

	# pregunta si tiene childs
	# "_btns_e.html.erb"
	def has_child?(objeto)
		# Considera TODO, hasta los has_many through
		objeto.class.reflect_on_all_associations(:has_many).map { |a| objeto.send(a.name).any? }.include?(true)
	end

	## ------------------------------------------------------- FORM & SHOW

	# apoyo de filtro_condicional_field? (abajo)
	def get_field_condition(objeto, field)
		case objeto.class.name
		when 'Publicacion'
			objeto.origen == 'ingreso'
		end
	end

	# Manejo de campos condicionales FORM y SHOW
	def filtro_conditional_field?(objeto, field)
		if Rails.configuration.x.form.exceptions[objeto.class.name].present?
			Rails.configuration.x.form.exceptions[objeto.class.name][:conditional_fields].include?(field) ? get_field_condition(objeto, field) : false
		else
			true
		end
	end

	## ------------------------------------------------------- FORM

	def form_f_detail?(objeto)
		if Rails.configuration.x.form.exceptions[objeto.class.name].present?
			Rails.configuration.x.form.exceptions[objeto.class.name][:f_detail].present? ? Rails.configuration.x.form.exceptions[objeto.class.name][:f_detail] : false
		else
			false
		end
	end

	## ------------------------------------------------------- SHOW

	# Maneja comportamiento por defecto y excepciones de SHOW
	def in_show?(objeto, label)
		excepcion = false
		# Pregunta si el Modelo TIENE personalizacion
		if Rails.configuration.x.show.exceptions[objeto.class.name].present?
			# Pregunta si LABEL tiene personalizacion
			excepcion = Rails.configuration.x.show.exceptions[objeto.class.name][:elementos].present? ? Rails.configuration.x.show.exceptions[objeto.class.name][:elementos].include?(label) : false
		end 

		de = Rails.configuration.s_default[label]
		(excepcion ? (not de) : de)
	end

	# SHOW_TITLE con manejo de excepciones
	# Se usa dentro de la aplicación también
	def show_title(objeto)
		if Rails.configuration.x.show.exceptions[objeto.class.name].present?
			if Rails.configuration.x.show.exceptions[objeto.class.name][:elementos].present?
				if Rails.configuration.x.show.exceptions[objeto.class.name][:elementos].include?('show_title')
					case objeto.class.name
					when 'Publicacion'
						objeto.title
					end
				else
					objeto.send(objeto.class.name.downcase)
				end
			else
				objeto.send(objeto.class.name.downcase)
			end
		else
			objeto.send(objeto.class.name.downcase)
		end
	end

	def show_links(objeto)
		case objeto.class.name
		when 'Publicacion'
			[
				['Editar',     [:edit, objeto], objeto.origen == 'ingreso'],
				['Papelera',   "/publicaciones/estado?publicacion_id=#{objeto.id}&estado=papelera",     (['ingreso', 'duplicado'].include?(objeto.estado) and objeto.origen = 'ingreso')],
				['Eliminar',   "/publicaciones/estado?publicacion_id=#{objeto.id}&estado=eliminado",    ['papelera'].include?(objeto.estado)],
				['Publicar',   "/publicaciones/estado?publicacion_id=#{objeto.id}&estado=publicada",    (['ingreso'].include?(objeto.estado) and objeto.title.present? and objeto.author.present? and objeto.journal.present?)],	
				['Ingreso',    "/publicaciones/estado?publicacion_id=#{objeto.id}&estado=ingreso",      (['publicado', 'papelera'].include?(objeto.estado) and objeto.origen == 'ingreso')],
				['Múltiple',   "/publicaciones/estado?publicacion_id=#{objeto.id}&estado=multiple",     objeto.estado == 'duplicado'],
				['Corrección', "/publicaciones/estado?publicacion_id=#{objeto.id}&estado=correccion",   (objeto.estado == 'publicada' and objeto.origen == 'ingreso' and objeto.textos.empty?)]
			]
		end
	end

	# método de apoyo usado en el método has_many_tabs (arriba)
	def hidden_childs(controller)
		Rails.configuration.x.show.hidden[controller].present? ? Rails.configuration.x.show.hidden[controller] : []
	end

	# Toma las relaciones has_many y les descuenta las HIDDEN_CHILDS
	# "_show.html.erb"
	def has_many_tabs(controller)
		controller.classify.constantize.reflect_on_all_associations(:has_many).map {|a| a.name.to_s} - hidden_childs(controller)
	end

	# manejo de f_tabla para manejar tablas asociadas
	# /show/_detalle.html.erb
	def f_tabla_field(objeto, label)
		if Rails.configuration.x.tables.bt_fields[objeto.class.name].present?
			if Rails.configuration.x.tables.bt_fields[objeto.class.name][label].present?
				if Rails.configuration.x.tables.bt_fields[objeto.class.name][label][0] == 'bt_field'
					objeto.send(Rails.configuration.x.tables.bt_fields[objeto.class.name][label][1]).send(label)
				else
					'Objeto NO encontrado'
				end
			else
				'Objeto NO encontrado'
			end
		else
			'Objeto NO encontrado'
		end
	end

	## ------------------------------------------------------- GENERAL

	# Manejode options para selectors múltiples
	def get_html_opts(options, label, value)
		opts = options.clone
		opts[label] = value
		opts
	end

	# Corrige palabras
	# "_title.html.erb"
	def corrige(w)
		case w
		when 'Controlador'
			'label'
		else
			w.capitalize
		end
	end

	## ------------------------------------------------------- LIST

	def text_with_badge(text, badge_value=nil)
	    badge = content_tag :span, badge_value, class: 'badge badge-primary badge-pill'
	    text = raw "#{text} #{badge}" if badge_value
	    return text
	end

	## ------------------------------------------------------- PUBLICACION

	def get_evaluacion_publicacion(publicacion, item)
		@activo = Perfil.find(session[:perfil_activo]['id'])
		e = @activo.evaluaciones.find_by(aspecto: item, publicacion_id: publicacion.id)
		e.blank? ? '[no evaluado]' : e.evaluacion
	end

	def get_btns_evaluacion(publicacion, item)
		eval_actual = publicacion.evaluaciones.find_by(aspecto: item)
		excluido = eval_actual.blank? ? [] : [eval_actual.evaluacion]
		Publicacion::EVALUACION[item] - excluido
	end

end
