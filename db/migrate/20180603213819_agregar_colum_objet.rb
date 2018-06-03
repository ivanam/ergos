class AgregarColumObjet < ActiveRecord::Migration[5.0]
  def change
  	add_column :tipo_objetivos, :periodo, :string
  end
end
