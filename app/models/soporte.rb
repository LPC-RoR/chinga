class Soporte < ApplicationRecord

	require 'carrierwave/orm/activerecord'

	TABLA_FIELDS = [
		['soporte', 'normal']
	]

	FORM_FIELDS = [
		['soporte', 'entry'],
		['owner_id',     'hidden']
	]

	mount_uploader :imagen, ImagenUploader

	belongs_to :tipo_soporte
	belongs_to :perfil, optional: true
	belongs_to :elemento, optional: true
end
