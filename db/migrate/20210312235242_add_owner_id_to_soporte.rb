class AddOwnerIdToSoporte < ActiveRecord::Migration[5.2]
  def change
    add_column :soportes, :owner_id, :integer
    add_index :soportes, :owner_id

    remove_column :soportes, :tipo, :string
    remove_column :soportes, :anio, :string
  end
end
