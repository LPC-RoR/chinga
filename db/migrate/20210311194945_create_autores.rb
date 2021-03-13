class CreateAutores < ActiveRecord::Migration[5.2]
  def change
    create_table :autores do |t|
      t.string :autor
      t.integer :perfil_id

      t.timestamps
    end
    add_index :autores, :perfil_id
  end
end
