class CreatePuntoVenta < ActiveRecord::Migration[5.0]
  def change
    create_table :punto_venta do |t|
      t.string :nombre
      t.string :domicilio
      t.integer :concesionaria_id

      t.timestamps
    end
  end
end
