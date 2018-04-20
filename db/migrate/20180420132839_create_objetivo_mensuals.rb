class CreateObjetivoMensuals < ActiveRecord::Migration[5.0]
  def change
    create_table :objetivo_mensuals do |t|
      t.string :descripcion
      t.date :fecha_creacion
      t.integer :tipo_objetivo_id
      t.integer :cantidad_propuesta
      t.integer :mes
      t.integer :anio
      t.integer :user_id
      t.integer :vendedor_id
      t.integer :punto_venta_id

      t.timestamps
    end
  end
end
