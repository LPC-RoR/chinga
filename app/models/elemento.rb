class Elemento < ApplicationRecord

	require 'carrierwave/orm/activerecord'

	# Campos qeu se despliegan en la tabla
	TABLA_FIELDS = [
		['titulo',           'show'], 
		['autor',          'normal'], 
		['d_soporte',      'normal'], 
		['annio_creacion', 'normal']
	]

	SHOW_FIELDS = [
		['interprete',     'normal'], 
		['disco',          'normal'], 
		['forma_musical',  'normal'], 
		['ciudad_autor',   'normal'], 
		['pais',           'normal'], 
		['annio_creacion', 'normal'], 
		['annio_estreno',  'normal'], 
		['otro_soporte',   'normal']
	]

	belongs_to :perfil

	has_many :lineas

	has_many :clasificaciones
	has_many :listas, through: :clasificaciones

	has_many :rutas
	has_many :claves, through: :rutas

	mount_uploader :ilustracion, IlustracionUploader

	def d_letra
	  self.letra.gsub(/\n/, '<br>')
	end

	def d_soporte
		"#{self.soporte} | #{self.soporte_nombre}"
	end

end
