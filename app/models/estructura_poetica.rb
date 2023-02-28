class EstructuraPoetica < ApplicationRecord
	TABLA_FIELDS = [
		'estructura_poetica'
#		['estructura_poetica', 'normal']
	]

	FORM_FIELDS = [
		['estructura_poetica', 'entry'],
		['owner_id',    'hidden']
	]
end
