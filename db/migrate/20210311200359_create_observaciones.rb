class CreateObservaciones < ActiveRecord::Migration[5.2]
  def change
    create_table :observaciones do |t|
      t.string :observacion
      t.text :detalle
      t.integer :elemento_id
      t.integer :owner_id

      t.timestamps
    end
    add_index :observaciones, :elemento_id
    add_index :observaciones, :owner_id
  end
end
