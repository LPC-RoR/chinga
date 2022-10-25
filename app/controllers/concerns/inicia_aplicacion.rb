module IniciaAplicacion
	extend ActiveSupport::Concern

	def set_tablas_base
		
		# VERIFICA QUE TABLAS Y REGISTROS MINIMOS ESTÉN PRESENTES Y MIGRADOS SI CORRESPONDE
		# SB_ADMINISTRACION

		# SB_LISTAS

		if ActiveRecord::Base.connection.table_exists? 'sb_listas'
			# LISTA ADMINISTRACION
			lista = SbLista.find_by(lista: 'Administración')
			if lista.blank?
				lista = SbLista.create(lista: 'Administración', acceso: 'admin', link: '/recursos/administracion')
			end

			if ActiveRecord::Base.connection.table_exists? 'sb_elementos'
				elementos = lista.sb_elementos

				e_1 = elementos.find_by(elemento: 'Administradores')
				if e_1.blank?
					lista.sb_elementos.create(orden: 1, nivel: 1, tipo: 'item', elemento: 'Administradores', acceso: 'admin', activo: true, despliegue: 'list', controlador: 'app_administradores')
				end

				e_2 = elementos.find_by(elemento: 'Nómina')
				if e_2.blank?
					lista.sb_elementos.create(orden: 2, nivel: 1, tipo: 'item', elemento: 'Nómina', acceso: 'admin', activo: true, despliegue: 'list', controlador: 'nominas')
				end

				e_3 = elementos.find_by(elemento: 'Perfiles')
				if e_3.blank?
					lista.sb_elementos.create(orden: 3, nivel: 1, tipo: 'item', elemento: 'Perfiles', acceso: 'admin', activo: true, despliegue: 'list', controlador: 'perfiles')
				end

				e_4 = elementos.find_by(elemento: 'Menús Laterales')
				if e_4.blank?
					lista.sb_elementos.create(orden: 4, nivel: 1, tipo: 'item', elemento: 'Menús Laterales', acceso: 'admin', activo: true, despliegue: 'list', controlador: 'sb_listas')
				end

				e_5 = elementos.find_by(elemento: 'Tutoriales')
				if e_5.blank?
					lista.sb_elementos.create(orden: 5, nivel: 1, tipo: 'item', elemento: 'Tutoriales', acceso: 'admin', activo: true, despliegue: 'list', controlador: 'hlp_tutoriales')
				end
			end

			# LISTA AYUDA
			ayuda = SbLista.find_by(lista: 'Ayuda')
			if ayuda.blank?
				ayuda = SbLista.create(lista: 'Ayuda', acceso: 'admin', link: '/recursos/ayuda')
			end
		end		

		# APP_ADMINISTRADORES

		if ActiveRecord::Base.connection.table_exists? 'app_administradores'
			# DOG
			dog = AppAdministrador.find_by(email: 'hugo.chinga.g@gmail.com')
			if dog.blank?
				AppAdministrador.create(administrador: 'Hugo Chinga G.', email: 'hugo.chinga.g@gmail.com')
			end

			if ActiveRecord::Base.connection.table_exists? 'administradores'
				Administrador.all.each do |adm|
					app_adm = AppAdministrador.find_by(email: adm.email)
					if app_adm.blank?
						AppAdministrador.create(administrador: adm.administrador, email: adm.email)
					end
				end
			end
		end
		
		# APP_NOMINAS

		if ActiveRecord::Base.connection.table_exists? 'app_nominas'
			if ActiveRecord::Base.connection.table_exists? 'nominas'
				Nomina.all.each do |nom|
					app_nom = AppNomina.find_by(email: nom.email)
					if app_nom.blank?
						AppNomina.create(nombre: nom.nombre, email: nom.email, tipo: nom.tipo)
					end
				end
			end
		end

		# APP_PERFILES

		if ActiveRecord::Base.connection.table_exists? 'app_perfiles'
			if ActiveRecord::Base.connection.table_exists? 'perfiles'
				Perfil.all.each do |per|
					app_per = AppPerfil.find_by(email: per.email)
					if app_per.blank?
						app_perfil = AppPerfil.create(usuario_id: current_usuario.id, email: per.email)
						administrador = AppAdministrador.find_by(email: per.email)
						if administrador.present?
							app_perfil.app_administrador = administrador
							app_perfil.save
						end
					end
				end
			end
		end

		# HLP_TUTORIALES

		if ActiveRecord::Base.connection.table_exists? 'hlp_tutoriales'
			if ActiveRecord::Base.connection.table_exists? 'tutoriales'
				Tutorial.all.each do |tut|
					app_tut = HlpTutorial.find_by(tutorial: tut.tutorial)
					if app_tut.blank?
						HlpTutorial.create(tutorial: tut.tutorial, detalle: tut.detalle)
					end
				end
			end
		end

		# HLP_PASOS

		if ActiveRecord::Base.connection.table_exists? 'hlp_pasos'
			if ActiveRecord::Base.connection.table_exists? 'pasos'
				Paso.all.each do |pas|
					app_pas = HlpPaso.find_by(paso: pas.paso)
					if app_pas.blank?
						app_pas = HlpTutorial.create(orden: pas.orden, paso: pas.paso, detalle: pas.detalle)
						app_pas.tutorial = pas.tutorial
						app_pas.save
					end
				end
			end
		end

	end

	def inicia_app
		
	end

end