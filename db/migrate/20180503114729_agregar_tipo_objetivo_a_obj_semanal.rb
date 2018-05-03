class AgregarTipoObjetivoAObjSemanal < ActiveRecord::Migration[5.0]
  def change
  	add_column :objetivo_semanals, :tipo_objetivo_id, :integer
  end
end
