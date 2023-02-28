class GeneroAutor < ApplicationRecord
	TABLA_FIELDS = [
		'genero_autor'
#		['genero_autor', 'normal']
	]

	FORM_FIELDS = [
		['genero_autor', 'entry'],
		['owner_id',    'hidden']
	]
end
