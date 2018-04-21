class AgregarPuntoVenta < ActiveRecord::Migration[5.0]
  def change
  	add_column :vendedors, :punto_venta_id, :integer
  end
end
