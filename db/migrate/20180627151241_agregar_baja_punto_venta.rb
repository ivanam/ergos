class AgregarBajaPuntoVenta < ActiveRecord::Migration[5.0]
  def change
  	add_column :punto_venta, :baja, :boolean, :default => false
  	add_column :punto_venta, :fecha_baja, :date
  end
end
