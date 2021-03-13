class CreateGeneroAutores < ActiveRecord::Migration[5.2]
  def change
    create_table :genero_autores do |t|
      t.string :genero_autor
      t.integer :owner_id

      t.timestamps
    end
    add_index :genero_autores, :owner_id
  end
end
