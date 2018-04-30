class ReunionParticipante < ApplicationRecord
	belongs_to :persona, :foreign_key => 'persona_id', :class_name => 'Persona'
  	#belongs_to :reunion, :foreign_key => 'reunion_id', :class_name => 'Reunion'
end
