class AgregarCamposAReunion < ActiveRecord::Migration[5.0]
  def change
  	add_column :reunions, :mensual, :boolean
  end
end
