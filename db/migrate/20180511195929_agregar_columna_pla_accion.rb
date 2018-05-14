class AgregarColumnaPlaAccion < ActiveRecord::Migration[5.0]
  def change
  	add_column :reunions, :plan_accion, :string
  	add_column :reunions, :accion, :string
  end
end
