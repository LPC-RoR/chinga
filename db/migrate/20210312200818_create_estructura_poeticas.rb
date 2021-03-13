class CreateEstructuraPoeticas < ActiveRecord::Migration[5.2]
  def change
    create_table :estructura_poeticas do |t|
      t.string :estructura_poetica
      t.integer :owner_id

      t.timestamps
    end
    add_index :estructura_poeticas, :owner_id
  end
end
