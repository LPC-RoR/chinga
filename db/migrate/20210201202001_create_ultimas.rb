class CreateUltimas < ActiveRecord::Migration[5.2]
  def change
    create_table :ultimas do |t|
      t.string :ultima
      t.string :sha1

      t.timestamps
    end
    add_index :ultimas, :ultima
    add_index :ultimas, :sha1
  end
end
