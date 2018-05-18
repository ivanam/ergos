class AgregarTipoOnjeaTipoObj < ActiveRecord::Migration[5.0]
  def change
  	add_column :tipo_objetivos, :tipo, :string
  end
end
