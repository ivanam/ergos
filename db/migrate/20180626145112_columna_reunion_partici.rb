class ColumnaReunionPartici < ActiveRecord::Migration[5.0]
  def change
  	add_column :reunion_participantes, :vendedor_id, :integer
  end
end
