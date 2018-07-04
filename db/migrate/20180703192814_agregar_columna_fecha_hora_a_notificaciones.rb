class AgregarColumnaFechaHoraANotificaciones < ActiveRecord::Migration[5.0]
  def change
  	add_column :notifications, :fecha, :date
  	add_column :notifications, :hora, :integer
  end
end
