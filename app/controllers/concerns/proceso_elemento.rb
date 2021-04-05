module ProcesoElemento
	extend ActiveSupport::Concern

	ELEMENTOS = ['titulo', 'interprete', 'autor', 'genero_autor', 'forma_musical', 'estructura_poetica', 'soporte', 'soporte_nombre']

	def claves_campos(objeto, campo, indice)
		unless campo.blank?
			elemento_sha1 = Digest::SHA1.hexdigest(campo.strip.downcase)
			clave_elemento = Clave.find_by(sha1: elemento_sha1)

			if clave_elemento.blank?
				clave_elemento = Clave.create(clave: campo, sha1: elemento_sha1, orden: indice+1)
				objeto.claves << clave_elemento
			else
				unless objeto.claves.ids.include?(clave_elemento.id)
					objeto.claves << clave_elemento
				end
			end
		end
	end

	def procesa_elemento(objeto)

		ELEMENTOS.each_with_index do |val, indice|
			claves_campos(objeto, objeto.send(val), indice)
		end
	end

	def desprocesa_elemento(objeto)
		claves_ids = objeto.claves.ids
		objeto.claves.delete_all

		claves = Clave.find(claves_ids)
		claves.each do |clv|
			clv.delete if clv.elementos.empty?
		end
	end
end