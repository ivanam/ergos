class CreatePersonaConcesionaria < ActiveRecord::Migration[5.0]
  def change
    create_table :persona_concesionaria do |t|
      t.references :persona, foreign_key: true
      t.references :concesionaria, foreign_key: true

      t.timestamps
    end
  end
end
