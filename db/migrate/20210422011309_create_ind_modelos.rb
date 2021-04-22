class CreateIndModelos < ActiveRecord::Migration[5.2]
  def change
    create_table :ind_modelos do |t|
      t.integer :ind_estructura_id
      t.string :ind_modelo
      t.string :campos
      t.string :facetas

      t.timestamps
    end
    add_index :ind_modelos, :ind_estructura_id
    add_index :ind_modelos, :ind_modelo
  end
end
