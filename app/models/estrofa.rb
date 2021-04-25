class Estrofa < ApplicationRecord
	belongs_to :elemento

	has_many :lineas
end
