class AgregarAdjuntoReunion < ActiveRecord::Migration[5.0]
  def change
  	add_column :reunions, :adjunto, :blob
  end
end
