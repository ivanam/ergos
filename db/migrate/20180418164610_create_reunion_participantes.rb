class CreateReunionParticipantes < ActiveRecord::Migration[5.0]
  def change
    create_table :reunion_participantes do |t|
      t.integer :reunion_id
      t.integer :user_id

      t.timestamps
    end
  end
end
