class AddOwnerIdToTipoSoporte < ActiveRecord::Migration[5.2]
  def change
    add_column :tipo_soportes, :owner_id, :integer
    add_index :tipo_soportes, :owner_id
  end
end
