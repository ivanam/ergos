class CreateCargaDiaria < ActiveRecord::Migration[5.0]
  def change
    create_table :carga_diaria do |t|
      t.date :fecha
      t.integer :cantidad
      t.integer :tipo_objetivo_id
      t.integer :vendedor_id

      t.timestamps
    end
  end
end
