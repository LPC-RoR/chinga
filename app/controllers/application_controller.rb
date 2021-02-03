class ApplicationController < ActionController::Base
	## USO GENERAL
	# Este método se usa para construir un nombre de directorio a partir de un correo electrónico.
	def archivo_usuario(email)
		email.split('@').join('-').split('.').join('_')
	end

		def inicia_session
	    if usuario_signed_in? and session[:perfil_base].blank?
	      # Perro furioso
	      @dog = Administrador.find_by(email: 'hugo.chinga.g@gmail.com')
	      @dog = Administrador.create(administrador: 'Hugo Chinga G.', email: 'hugo.chinga.g@gmail.com') if @dog.blank?

	      # En este minuto SIMULA que viene de la autenticacion con un usuario.email == 'hugo.chinga.g@gmail.com'
	      # 1.- Verifica si Hay Perfil para ese correo
	      @perfil = Perfil.find_by(email: current_usuario.email)
	      @perfil = Perfil.create(email: current_usuario.email) if @perfil.blank?

	      # 2.- Preguntamos SI ESTA EN LA LISTA DE ADMINISTRADORES, si ESTÁ se asegura de relacionarlo
	      @administrador = Administrador.find_by(email: @perfil.email)
	      # ACTUALIZO ADMINISTRADOR DEL PERFIL SI ES NECESARIO
	      if @administrador.present? and @perfil.administrador.blank?
	        @perfil.administrador = @administrador
	        @perfil.save
	      end

	      session[:perfil_base]      = @perfil
	      session[:perfil_activo]    = @perfil
	      session[:administrador]    = @perfil.administrador
	      session[:es_administrador] = @perfil.administrador.present?
	    end
	end
end