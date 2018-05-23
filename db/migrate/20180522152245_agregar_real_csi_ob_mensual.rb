class AgregarRealCsiObMensual < ActiveRecord::Migration[5.0]
  def change
  	add_column :objetivo_mensuals, :csi_real, :integer
  end
end
