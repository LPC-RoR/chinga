class FormaMusical < ApplicationRecord
	TABLA_FIELDS = [
		'forma_musical'
#		['forma_musical', 'normal']
	]

	FORM_FIELDS = [
		['forma_musical', 'entry'],
		['owner_id',     'hidden']
	]
end
