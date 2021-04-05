class Perfil < ApplicationRecord

	require 'carrierwave/orm/activerecord'

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

	has_many :soportes

	has_many :comentarios, foreign_key: 'owner_id'

	mount_uploader :imagen, ImagenUploader

	def d_nombre
		self.nombre.blank? ? 'No ingresado' : self.nombre
	end

	def d_usuario
		self.usuario.blank? ? 'No ingresado' : self.usuario
	end

	def d_presentacion
		self.presentacion.blank? ? 'No ingresado' : self.presentacion
	end

	def recursos
		case self.listas.count
		when 0 
			listas = 'sin listas'
		when 1 
			listas = '1 lista'
		else
			listas = "#{self.listas.count} listas"
		end
		case self.contribuciones.count
		when 0 
			contribuciones = 'sin contribuciones'
		when 1 
			contribuciones = '1 contribución'
		else
			contribuciones = "#{self.contribuciones.count} contribuciones"
		end
		"#{contribuciones} & #{listas}"
	end

end
