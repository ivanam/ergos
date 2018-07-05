class AgregarCamposAConcesionaria < ActiveRecord::Migration[5.0]
  def change
  	add_column :concesionaria, :hora, :integer
  	add_column :concesionaria, :minutos, :integer
  end
end
