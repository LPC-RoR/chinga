class CreateElementos < ActiveRecord::Migration[5.2]
  def change
    create_table :elementos do |t|
      t.string :titulo
      t.text :letra
      t.string :autor
      t.string :genero
      t.string :pais
      t.string :ciudad_autor
      t.string :interprete
      t.string :disco
      t.string :link
      t.string :forma_musical
      t.integer :annio_creacion
      t.integer :annio_estreno
      t.string :otro_soporte
      t.integer :perfil_id

      t.timestamps
    end
    add_index :elementos, :titulo
    add_index :elementos, :genero
    add_index :elementos, :pais
    add_index :elementos, :ciudad_autor
    add_index :elementos, :interprete
    add_index :elementos, :disco
    add_index :elementos, :forma_musical
    add_index :elementos, :annio_creacion
    add_index :elementos, :annio_estreno
    add_index :elementos, :perfil_id
  end
end
