class CreateEvaluaciones < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluaciones do |t|
      t.string :aspecto
      t.string :evaluacion
      t.integer :elemento_id
      t.integer :perfil_id

      t.timestamps
    end
    add_index :evaluaciones, :elemento_id
    add_index :evaluaciones, :perfil_id
  end
end
