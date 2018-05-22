class ElimirRealCsiObMensual < ActiveRecord::Migration[5.0]
  def change
  	remove_column :objetivo_mensuals, :csi_real
  end
end
