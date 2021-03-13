class CreateClaves < ActiveRecord::Migration[5.2]
  def change
    create_table :claves do |t|
      t.string :clave
      t.string :sha1
      t.integer :orden

      t.timestamps
    end
    add_index :claves, :sha1
    add_index :claves, :orden
  end
end
