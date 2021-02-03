class Lista < ApplicationRecord
	TABLA_FIELDS = [
		['lista',         'show']
	]

 	FORM_FIELDS = [
		['lista',        'entry'],
		['perfil_id',     'hidden']
	]

	belongs_to :perfil

	has_many :clasificaciones
	has_many :elementos, through: :clasificaciones

	has_many :herencias
	has_many :equipos, through: :herencias
end
