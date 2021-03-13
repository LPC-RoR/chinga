class CreateInterpretes < ActiveRecord::Migration[5.2]
  def change
    create_table :interpretes do |t|
      t.string :interprete
      t.integer :perfil_id

      t.timestamps
    end
    add_index :interpretes, :perfil_id
  end
end
