class CambiarTipoCampoConcecionaria < ActiveRecord::Migration[5.0]
  def change
  	change_column :concesionaria, :fin_jornada, :integer
  	change_column :concesionaria, :inicio_jornada, :integer
  end
end
