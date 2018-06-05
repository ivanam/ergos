class AgregarColumnaMesAReunion < ActiveRecord::Migration[5.0]
  def change
  	add_column :reunions, :mes, :string
  end
end
