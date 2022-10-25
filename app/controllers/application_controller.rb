class ApplicationController < ActionController::Base

	include IniciaAplicacion

	# Este método se usa para construir un nombre de directorio a partir de un correo electrónico.
	def archivo_usuario(email)
		email.split('@').join('-').split('.').join('_')
	end

	def inicia_sesion
		if usuario_signed_in? and session[:perfil_base].blank?
			# Perro furioso

			set_tablas_base
			
			@dog = Administrador.find_by(email: 'hugo.chinga.g@gmail.com')
			@dog = Administrador.create(administrador: 'Hugo Chinga G.', email: 'hugo.chinga.g@gmail.com') if @dog.blank?

			# En este minuto SIMULA que viene de la autenticacion con un usuario.email == 'hugo.chinga.g@gmail.com'
			# 1.- Verifica si Hay Perfil para ese correo
			@perfil = Perfil.find_by(email: current_usuario.email)

			if @perfil.blank?
				# TODAS las aplicaciones en Capitan tienen una tabla 'administradores'
				if ActiveRecord::Base.connection.table_exists? 'administradores'
					administrador = Administrador.find_by(email: current_usuario.email)
					if administrador.present?
						@perfil = Perfil.create(email: current_usuario.email)
						@perfil.administrador = administrador
						@perfil.save
					end
				end
				# Las aplicaciones con Capitan que NO tienen tabla 'nominas' se asume que tienen LIBRE REGISTRO
				if ActiveRecord::Base.connection.table_exists? 'nominas'
					nomina = Nomina.find_by(email: current_usuario.email)
					if nomina.present?
						@perfil = Perfil.create(email: current_usuario.email)
					end
				else
					# LIBRE REGISTRO
					@perfil = Perfil.create(email: current_usuario.email)
				end

				session[:hay_perfil]       = (@perfil-present? ? true : false)
			else
				session[:hay_perfil]       = true

				session[:perfil_base]      = @perfil
				session[:perfil_activo]    = @perfil
				session[:administrador]    = @perfil.administrador
				session[:es_administrador] = @perfil.administrador.present?

				inicia_app
			end
		end
	end
end