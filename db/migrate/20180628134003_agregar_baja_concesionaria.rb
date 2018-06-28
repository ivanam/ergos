class AgregarBajaConcesionaria < ActiveRecord::Migration[5.0]
  def change
  	add_column :concesionaria, :baja, :boolean, :default => false
  end
end
