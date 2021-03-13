class CreateParticipantes < ActiveRecord::Migration[5.2]
  def change
    create_table :participantes do |t|
      t.integer :perfil_id
      t.integer :rueda_id

      t.timestamps
    end
    add_index :participantes, :perfil_id
    add_index :participantes, :rueda_id
  end
end
