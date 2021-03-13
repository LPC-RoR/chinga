class AddIlustracionToElemento < ActiveRecord::Migration[5.2]
  def change
    add_column :elementos, :ilustracion, :string
    add_column :elementos, :ilustracion_cache, :string
  end
end
