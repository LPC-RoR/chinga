class Rueda < ApplicationRecord
	TABLA_FIELDS = [
		['rueda', 'show']
#		['sha1', 'normal']
	]

	belongs_to :administrador, class_name: 'Perfil'

	has_many :participantes
	has_many :perfiles, through: :participantes
end
