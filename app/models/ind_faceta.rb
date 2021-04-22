class IndFaceta < ApplicationRecord
	belongs_to :ind_estructura

	has_many :ind_indices
end
