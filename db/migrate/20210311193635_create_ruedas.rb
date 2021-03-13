class CreateRuedas < ActiveRecord::Migration[5.2]
  def change
    create_table :ruedas do |t|
      t.integer :administrador_id
      t.string :rueda
      t.string :ubicacion
      t.text :invitacion

      t.timestamps
    end
    add_index :ruedas, :administrador_id
  end
end
