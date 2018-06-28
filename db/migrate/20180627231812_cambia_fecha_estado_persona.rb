class CambiaFechaEstadoPersona < ActiveRecord::Migration[5.0]
    def up
  	change_column :estado_personas, :fecha_inicio, :datetime
  end

  def down
  	change_column :estado_personas, :fecha_inicio, :datetime
  end
end
