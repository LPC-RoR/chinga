class AddRedesSocialesToPerfil < ActiveRecord::Migration[5.2]
  def change
    add_column :perfiles, :facebook, :string
    add_column :perfiles, :instagram, :string
  end
end
