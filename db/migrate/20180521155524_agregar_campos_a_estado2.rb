class AgregarCamposAEstado2 < ActiveRecord::Migration[5.0]
  def change
  	remove_column :estado_personas, :estado
  	remove_column :estado_personas, :descripcion
  end
end
