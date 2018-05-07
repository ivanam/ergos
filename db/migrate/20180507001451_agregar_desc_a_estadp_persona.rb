class AgregarDescAEstadpPersona < ActiveRecord::Migration[5.0]
  def change
  	  	add_column :estado_personas, :descripcion, :string
  end
end
