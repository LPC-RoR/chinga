module CapitanBuscadorHelper
	## ------------------------------------------------------- BUSCADOR

	def excepciones
		{
			pronombres:    true,
			articulos:     true,
			proposiciones: true,
			conjunciones:  true,
			adverbios:    false,
			verboser:      true,
			numbers:       true,
			exceptions:    true
		}
	end
end