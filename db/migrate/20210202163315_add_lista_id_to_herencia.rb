class AddListaIdToHerencia < ActiveRecord::Migration[5.2]
  def change
    add_column :herencias, :lista_id, :integer
    add_index :herencias, :lista_id

    remove_column :herencias, :carpeta_id, :integer
  end
end
