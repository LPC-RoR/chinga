class AddNombreUsuarioToPerfil < ActiveRecord::Migration[5.2]
  def change
    add_column :perfiles, :nombre, :string
    add_column :perfiles, :usuario, :string
    add_index :perfiles, :usuario
  end
end
