class Soporte < ApplicationRecord
	TABLA_FIELDS = [
		['soporte', 'normal']
	]

	FORM_FIELDS = [
		['soporte', 'entry'],
		['owner_id',     'hidden']
	]
end
