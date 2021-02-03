class CreateTextos < ActiveRecord::Migration[5.2]
  def change
    create_table :textos do |t|
      t.string :texto
      t.string :sha1

      t.timestamps
    end
    add_index :textos, :texto
    add_index :textos, :sha1
  end
end
