class AddOwnerIdToComentario < ActiveRecord::Migration[5.2]
  def change
    add_column :comentarios, :owner_id, :integer
    add_index :comentarios, :owner_id
  end
end
