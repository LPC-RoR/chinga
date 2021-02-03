class AddEstadoToElemento < ActiveRecord::Migration[5.2]
  def change
    add_column :elementos, :estado, :string
    add_index :elementos, :estado
  end
end
