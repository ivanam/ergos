class CreateObjetivos < ActiveRecord::Migration[5.0]
  def change
    create_table :objetivos do |t|
      t.date :fecha_creacion
      t.string :descripcion
      t.integer :tipo_indicador_id
      t.integer :cantidad_propuesta
      t.integer :mes
      t.integer :anio
      t.integer :user_id
      t.integer :user_id
      t.integer :user_id

      t.timestamps
    end
  end
end
