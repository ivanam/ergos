class AgregarBajaVendedores < ActiveRecord::Migration[5.0]
  def change
  	add_column :vendedors, :baja, :boolean
  end
end
