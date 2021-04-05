class Comentario < ApplicationRecord
	belongs_to :elemento
	belongs_to :perfil, foreign_key: 'owner_id'

	def d_detalle
	  self.detalle.blank? ? '' : self.detalle.gsub(/\n/, '<br>')
	end
end
