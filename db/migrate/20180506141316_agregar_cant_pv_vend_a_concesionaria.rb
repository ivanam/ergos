class AgregarCantPvVendAConcesionaria < ActiveRecord::Migration[5.0]
  def change
  	add_column :concesionaria, :cantPv, :integer
  	add_column :concesionaria, :cantVend, :integer
  end
end
