class CreateUserPuntoVenta < ActiveRecord::Migration[5.0]
  def change
    create_table :user_punto_venta do |t|
      t.integer :user_id
      t.integer :punto_venta_id

      t.timestamps
    end
  end
end
