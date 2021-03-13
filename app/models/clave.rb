class Clave < ApplicationRecord
	has_many :rutas
	has_many :elementos, through: :rutas
end
