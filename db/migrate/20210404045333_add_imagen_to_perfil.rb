class AddImagenToPerfil < ActiveRecord::Migration[5.2]
  def change
    add_column :perfiles, :imagen, :string
  end
end
