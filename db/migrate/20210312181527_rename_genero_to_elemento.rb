class RenameGeneroToElemento < ActiveRecord::Migration[5.2]
  def change
    rename_column :elementos, :genero, :genero_autor
  end
end
