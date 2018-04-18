class CreateIndicadors < ActiveRecord::Migration[5.0]
  def change
    create_table :indicadors do |t|
      t.date :fecha
      t.integer :tipo_indicador_id
      t.integer :cantidad_completa

      t.timestamps
    end
  end
end
