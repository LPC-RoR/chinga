class CreateRutas < ActiveRecord::Migration[5.2]
  def change
    create_table :rutas do |t|
      t.integer :clave_id
      t.integer :elemento_id

      t.timestamps
    end
    add_index :rutas, :clave_id
    add_index :rutas, :elemento_id
  end
end
