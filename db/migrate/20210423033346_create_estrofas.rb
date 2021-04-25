class CreateEstrofas < ActiveRecord::Migration[5.2]
  def change
    create_table :estrofas do |t|
      t.integer :elemento_id
      t.integer :n_estrofa

      t.timestamps
    end
    add_index :estrofas, :n_estrofa
    add_index :estrofas, :elemento_id
  end
end
