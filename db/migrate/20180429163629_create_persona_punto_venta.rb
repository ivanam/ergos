class CreatePersonaPuntoVenta < ActiveRecord::Migration[5.0]
  def change
    create_table :persona_punto_venta do |t|
      t.references :persona, foreign_key: true
      t.references :punto_venta, foreign_key: true

      t.timestamps
    end
  end
end
