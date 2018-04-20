class CreateConcesionaria < ActiveRecord::Migration[5.0]
  def change
    create_table :concesionaria do |t|
      t.blob :icono
      t.string :nombre
      t.date :fecha_alta
      t.date :fecha_baja
      t.integer :user_id
      t.integer :empresa_id
      t.integer :persona_id

      t.timestamps
    end
  end
end
