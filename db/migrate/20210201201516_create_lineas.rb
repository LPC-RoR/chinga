class CreateLineas < ActiveRecord::Migration[5.2]
  def change
    create_table :lineas do |t|
      t.string :linea
      t.string :ultima
      t.integer :n_parrafo
      t.integer :n_linea
      t.integer :texto_id
      t.integer :ultima_id

      t.timestamps
    end
    add_index :lineas, :n_parrafo
    add_index :lineas, :n_linea
    add_index :lineas, :texto_id
    add_index :lineas, :ultima_id
  end
end
