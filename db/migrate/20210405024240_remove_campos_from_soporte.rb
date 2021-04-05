class RemoveCamposFromSoporte < ActiveRecord::Migration[5.2]
  def change
    remove_column :soportes, :perfil_id, :integer
    remove_column :soportes, :elemento_id, :integer
  end
end
