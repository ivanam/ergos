class CreateEquipos < ActiveRecord::Migration[5.0]
  def change
    create_table :equipos do |t|
      t.string :nombre
      t.date :fecha_alta
      t.date :fecha_baja
      t.integer :punto_venta_id

      t.timestamps
    end
  end
end
