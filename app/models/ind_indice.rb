class IndIndice < ApplicationRecord
	TABLA_FIELDS = [
		['class_name', 'normal'],
		['objeto_id', 'normal']
	]

	belongs_to :ind_estructura
	belongs_to :ind_clave, optional: true
	belongs_to :ind_faceta, optional: true
end
