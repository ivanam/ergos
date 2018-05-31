class CambioTipoCampoEnVendedor < ActiveRecord::Migration[5.0]

  def up
  	change_column :vendedors, :numero, :string
  end

  def down
  	change_column :vendedors, :numero, :string
  end

end
