class CreateIntegrantes < ActiveRecord::Migration[5.2]
  def change
    create_table :integrantes do |t|
      t.integer :equipo_id
      t.integer :paerfil_id

      t.timestamps
    end
    add_index :integrantes, :equipo_id
    add_index :integrantes, :paerfil_id
  end
end
