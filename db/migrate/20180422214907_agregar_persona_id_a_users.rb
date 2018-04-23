class AgregarPersonaIdAUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :persona_id, :integer
  end
end
