class CampoVendedorEstadoPersona < ActiveRecord::Migration[5.0]
  def change
  	add_column :estado_personas, :vendedor_id, :integer
  end
end
