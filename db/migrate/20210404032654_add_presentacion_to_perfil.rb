class AddPresentacionToPerfil < ActiveRecord::Migration[5.2]
  def change
    add_column :perfiles, :presentacion, :text
  end
end
