class CreateReunions < ActiveRecord::Migration[5.0]
  def change
    create_table :reunions do |t|
      t.date :fecha
      t.integer :semana
      t.string :lugar_fisico
      t.integer :user_id

      t.timestamps
    end
  end
end
