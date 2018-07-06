class CambiarTipoFinJornada < ActiveRecord::Migration[5.0]
  def change
  	change_column :concesionaria, :fin_jornada, :string
  end
end
