class AddRelFacteasToIndModelo < ActiveRecord::Migration[5.2]
  def change
    add_column :ind_modelos, :rel_facetas, :string
  end
end
