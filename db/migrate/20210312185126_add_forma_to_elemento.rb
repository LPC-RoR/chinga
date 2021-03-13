class AddFormaToElemento < ActiveRecord::Migration[5.2]
  def change
    add_column :elementos, :forma, :string
    add_index :elementos, :forma
  end
end
