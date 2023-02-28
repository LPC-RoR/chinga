class Equipo < ApplicationRecord
	TABLA_FIELDS = [
		's#equipo'
#		['equipo', 'show']
#		['sha1', 'normal']
	]

	SHOW_FIELDS = [
		['email',   'normal'],
		['sha1',    'normal']
	]

 	FORM_FIELDS = [
		['equipo',             'entry'],
		['perfil_id',         'hidden'],
	]

	belongs_to :administrador, class_name: 'Perfil'

	has_many :integrantes
	has_many :perfiles, through: :integrantes

	has_many :herencias
	has_many :listas, through: :herencias
end
