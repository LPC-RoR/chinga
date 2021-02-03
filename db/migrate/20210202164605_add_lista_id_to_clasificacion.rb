class AddListaIdToClasificacion < ActiveRecord::Migration[5.2]
  def change
    add_column :clasificaciones, :lista_id, :integer
    add_index :clasificaciones, :lista_id

    remove_column :clasificaciones, :carpeta_id, :integer
  end
end
