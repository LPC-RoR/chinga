class CreateCreaciones < ActiveRecord::Migration[5.2]
  def change
    create_table :creaciones do |t|
      t.integer :autor_id
      t.integer :elemento_id

      t.timestamps
    end
    add_index :creaciones, :autor_id
    add_index :creaciones, :elemento_id
  end
end
