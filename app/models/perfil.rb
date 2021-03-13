class Perfil < ApplicationRecord
	belongs_to :administrador, optional: true

	has_many :contribuciones, class_name: 'Elemento'
	has_many :listas
	has_many :equipos, foreign_key: 'administrador_id'
	has_many :rondas, foreign_key: 'administrador_id'

	has_many :integrantes
	has_many :participaciones, through: :integrantes, source: :equipo

	has_many :participantes
	has_many :ruedas_cantoras, through: :participantes, source: :rueda

	has_many :evaluaciones

end
