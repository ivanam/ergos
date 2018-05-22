class AgregarCamporAVendedor < ActiveRecord::Migration[5.0]
  def change
  	add_column :vendedors, :avance, :integer
  end
end
