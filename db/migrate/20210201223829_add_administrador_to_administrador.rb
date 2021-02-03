class AddAdministradorToAdministrador < ActiveRecord::Migration[5.2]
  def change
    add_column :administradores, :administrador, :string
  end
end
