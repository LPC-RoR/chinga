class CreateTipoSoportes < ActiveRecord::Migration[5.2]
  def change
    create_table :tipo_soportes do |t|
      t.string :tipo_soporte

      t.timestamps
    end
  end
end
