class TipoSoporte < ApplicationRecord
	TABLA_FIELDS = [
		['tipo_soporte', 'normal']
	]

	FORM_FIELDS = [
		['tipo_soporte', 'entry'],
		['owner_id',     'hidden']
	]

	has_many :soportes

end
