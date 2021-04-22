class CreateIndClaves < ActiveRecord::Migration[5.2]
  def change
    create_table :ind_claves do |t|
      t.integer :ind_clave
      t.integer :ind_estructura_id

      t.timestamps
    end
    add_index :ind_claves, :ind_clave
    add_index :ind_claves, :ind_estructura_id
  end
end
