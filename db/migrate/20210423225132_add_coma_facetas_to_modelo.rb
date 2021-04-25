class AddComaFacetasToModelo < ActiveRecord::Migration[5.2]
  def change
    add_column :ind_modelos, :coma_facetas, :string
  end
end
