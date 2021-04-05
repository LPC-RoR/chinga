class CreateComentarios < ActiveRecord::Migration[5.2]
  def change
    create_table :comentarios do |t|
      t.string :comentario
      t.text :detalle
      t.integer :elemento_id

      t.timestamps
    end
    add_index :comentarios, :elemento_id
  end
end
