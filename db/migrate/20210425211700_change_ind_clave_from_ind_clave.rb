class ChangeIndClaveFromIndClave < ActiveRecord::Migration[5.2]
  def change
	change_column :ind_claves, :ind_clave, :string
  end
end
