class AgregarCamposAEstado < ActiveRecord::Migration[5.0]
  def change

  	add_column :estado_personas, :estado_id, :integer

  end
end
