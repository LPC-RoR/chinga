class Linea < ApplicationRecord
	belongs_to :elemento
	belongs_to :texto
	belongs_to :ultima
end
