class AddElementoIdToLinea < ActiveRecord::Migration[5.2]
  def change
    add_column :lineas, :elemento_id, :integer
    add_index :lineas, :elemento_id
  end
end
