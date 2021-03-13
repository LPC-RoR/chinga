class CreateMejoras < ActiveRecord::Migration[5.2]
  def change
    create_table :mejoras do |t|
      t.string :mejora
      t.text :detalle
      t.integer :elemento_id
      t.integer :owner_id

      t.timestamps
    end
    add_index :mejoras, :elemento_id
    add_index :mejoras, :owner_id
  end
end
