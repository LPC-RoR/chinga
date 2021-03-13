class RemoveDiscoFromElemento < ActiveRecord::Migration[5.2]
  def change
    remove_column :elementos, :disco, :string
  end
end
