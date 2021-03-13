class CreateRegistros < ActiveRecord::Migration[5.2]
  def change
    create_table :registros do |t|
      t.integer :interprete_id
      t.integer :elemento_id

      t.timestamps
    end
    add_index :registros, :interprete_id
    add_index :registros, :elemento_id
  end
end
