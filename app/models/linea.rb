class Linea < ApplicationRecord
	belongs_to :elemento
	belongs_to :estrofa
	belongs_to :ultima, optional: true

	belongs_to :texto, optional: true
end
