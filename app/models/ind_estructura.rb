class IndEstructura < ApplicationRecord
	TABLA_FIELDS = [
		's#ind_estructura'
#		['ind_estructura', 'show']
	]

	FORM_FIELDS = [
		['ind_estructura', 'entry']
	]

	has_many :ind_modelos
	has_many :ind_palabras
	has_many :ind_expresiones
	has_many :ind_claves
	has_many :ind_indices
	has_many :ind_facetas
end
