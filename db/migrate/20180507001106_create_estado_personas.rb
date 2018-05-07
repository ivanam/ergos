class CreateEstadoPersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :estado_personas do |t|
      t.string :estado
      t.integer :persona_id
      t.datetime :fecha_inicio
      t.datetime :fecha_fin
      t.references :persona, foreign_key: true

      t.timestamps
    end
  end
end
