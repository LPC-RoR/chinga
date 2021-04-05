class AddReferencesToSoporte < ActiveRecord::Migration[5.2]
  def change
    add_column :soportes, :perfil_id, :integer
    add_index :soportes, :perfil_id
    add_column :soportes, :elemento_id, :integer
    add_index :soportes, :elemento_id
  end
end
