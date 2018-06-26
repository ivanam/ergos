class EstadoPersona < ApplicationRecord
  #has_many :persona
  belongs_to :estado, :class_name => 'Estado', :foreign_key => 'estado_id' , optional: :true
  belongs_to :vendedor, optional: :true

  validates :fecha_inicio, :presence => { :message => "Debe completar el campo Fecha" }
  validates :estado, :presence => { :message => "Debe seleccionar el Estado" }
  validates :vendedor, :presence => { :message => "Debe seleccionar el Vendedor" }


end
