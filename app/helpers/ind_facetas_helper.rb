module IndFacetasHelper
	
	def ind_fcts_texto(texto)
		if texto.blank?
			0
		else
			clave_texto = texto.to_s.downcase.gsub(',', ' ').gsub('.', ' ').split(' ').join(' ')
			fcts_texto = IndFaceta.find_by(ind_faceta: clave_texto)
			if fcts_texto.blank?
				0
			else
				fcts_texto.ind_indices.count
			end
		end
	end

	def get_faceta(texto)
		clave_texto = texto.to_s.downcase.gsub(',', ' ').gsub('.', ' ').split(' ').join(' ')
		(clave_texto.blank? ? nil : IndFaceta.find_by(ind_faceta: clave_texto))
	end

end
