class CreateVendedors < ActiveRecord::Migration[5.0]
  def change
    create_table :vendedors do |t|
      t.blob :foto
      t.integer :numero
      t.date :fecha_alta
      t.date :fecha_baja
      t.integer :persona_id

      t.timestamps
    end
  end
end
