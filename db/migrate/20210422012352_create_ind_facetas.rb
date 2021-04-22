class CreateIndFacetas < ActiveRecord::Migration[5.2]
  def change
    create_table :ind_facetas do |t|
      t.integer :ind_estructura_id
      t.string :ind_faceta
      t.string :faceta

      t.timestamps
    end
    add_index :ind_facetas, :ind_estructura_id
    add_index :ind_facetas, :ind_faceta
    add_index :ind_facetas, :faceta
  end
end
