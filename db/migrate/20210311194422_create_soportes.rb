class CreateSoportes < ActiveRecord::Migration[5.2]
  def change
    create_table :soportes do |t|
      t.string :soporte
      t.string :tipo
      t.integer :anio

      t.timestamps
    end
    add_index :soportes, :soporte
    add_index :soportes, :tipo
  end
end
