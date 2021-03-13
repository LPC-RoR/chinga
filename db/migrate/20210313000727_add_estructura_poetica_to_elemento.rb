class AddEstructuraPoeticaToElemento < ActiveRecord::Migration[5.2]
  def change
    add_column :elementos, :estructura_poetica, :string
    add_index :elementos, :estructura_poetica

    remove_column :elementos, :forma, :string
  end
end
