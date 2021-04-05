class AddSha1ToSoporte < ActiveRecord::Migration[5.2]
  def change
    add_column :soportes, :sha1, :string
  end
end
