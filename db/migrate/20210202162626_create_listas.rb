class CreateListas < ActiveRecord::Migration[5.2]
  def change
    create_table :listas do |t|
      t.string :lista
      t.integer :perfil_id

      t.timestamps
    end
    add_index :listas, :lista
    add_index :listas, :perfil_id
  end
end
