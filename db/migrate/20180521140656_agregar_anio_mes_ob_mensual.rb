class AgregarAnioMesObMensual < ActiveRecord::Migration[5.0]
  def change
   	add_column :objetivo_semanals, :mes, :integer
  	add_column :objetivo_semanals, :anio, :integer
  end
end
