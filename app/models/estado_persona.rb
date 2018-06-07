class EstadoPersona < ApplicationRecord
  #has_many :persona
  belongs_to :estado, :class_name => 'Estado', :foreign_key => 'estado_id'
  belongs_to :vendedor

end
