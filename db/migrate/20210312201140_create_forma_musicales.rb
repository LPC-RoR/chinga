class CreateFormaMusicales < ActiveRecord::Migration[5.2]
  def change
    create_table :forma_musicales do |t|
      t.string :forma_musical
      t.integer :owner_id

      t.timestamps
    end
    add_index :forma_musicales, :owner_id
  end
end
