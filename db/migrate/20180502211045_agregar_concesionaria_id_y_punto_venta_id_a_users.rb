class AgregarConcesionariaIdYPuntoVentaIdAUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :concesionaria_id, :integer
  	add_column :users, :punto_venta_id, :integer
  end
end
