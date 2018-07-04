class AgregarHoraInicioYFinConcesionaria < ActiveRecord::Migration[5.0]
  def change
  	add_column :concesionaria, :fin_jornada, :datetime
  	add_column :concesionaria, :inicio_jornada, :datetime
  end
end
