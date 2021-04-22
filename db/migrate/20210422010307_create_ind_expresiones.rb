class CreateIndExpresiones < ActiveRecord::Migration[5.2]
  def change
    create_table :ind_expresiones do |t|
      t.string :ind_expresion
      t.integer :ind_estructura_id

      t.timestamps
    end
    add_index :ind_expresiones, :ind_expresion
    add_index :ind_expresiones, :ind_estructura_id
  end
end
