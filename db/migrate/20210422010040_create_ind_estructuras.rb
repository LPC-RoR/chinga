class CreateIndEstructuras < ActiveRecord::Migration[5.2]
  def change
    create_table :ind_estructuras do |t|
      t.string :ind_estructura

      t.timestamps
    end
    add_index :ind_estructuras, :ind_estructura
  end
end
