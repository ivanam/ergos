class PersonaConcesionarium < ApplicationRecord
  belongs_to :persona
  belongs_to :concesionaria, :foreign_key => 'concesionaria', :class_name => 'Concesionarium'
end
