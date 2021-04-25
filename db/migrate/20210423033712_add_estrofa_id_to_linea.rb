class AddEstrofaIdToLinea < ActiveRecord::Migration[5.2]
  def change
    add_column :lineas, :estrofa_id, :integer
    add_index :lineas, :estrofa_id
  end
end
