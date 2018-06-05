class CambiarTipoFechaCampoAEstadoPersona < ActiveRecord::Migration[5.0]
  def up
  	change_column :estado_personas, :fecha_inicio, :date
  end

  def down
  	change_column :estado_personas, :fecha_inicio, :date
  end
end
