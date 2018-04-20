class CreateObjetivoSemanals < ActiveRecord::Migration[5.0]
  def change
    create_table :objetivo_semanals do |t|
      t.integer :objetivo_mensual_id
      t.date :fecha_creacion
      t.integer :cantidad_propuesta
      t.integer :numero_semana
      t.integer :user_id
      t.integer :vendedor_id
      t.integer :punto_venta_id

      t.timestamps
    end
  end
end
