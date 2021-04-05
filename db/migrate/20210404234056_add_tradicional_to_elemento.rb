class AddTradicionalToElemento < ActiveRecord::Migration[5.2]
  def change
    add_column :elementos, :tradicional, :boolean
    add_index :elementos, :tradicional
  end
end
