class AddSoporteToElemento < ActiveRecord::Migration[5.2]
  def change
    add_column :elementos, :soporte, :string
    add_index :elementos, :soporte
    add_column :elementos, :soporte_nombre, :string
  end
end
