class AddAnnioToSoporte < ActiveRecord::Migration[5.2]
  def change
    add_column :soportes, :annio, :integer
    add_index :soportes, :annio
  end
end
