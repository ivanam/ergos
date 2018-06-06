class Reunion < ApplicationRecord
	belongs_to :persona
	has_many :reunion_participantes, :foreign_key => 'reunion_id', :class_name => 'ReunionParticipante'
  has_many :personas, :through => :reunion_participantes



	validates :fecha, :presence => { :message => "Debe completar el campo Fecha" }
	# validates :semana, :presence => { :message => "Debe completar el campo Semana" }
 #  validates :semana, numericality: { only_integer: true, :message => "El campo Semana debe ser un valor entero"}
 #  validates :semana, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 4, :message => "El campo semana debe ser un valor entre 1 y 4"}
	validates :lugar_fisico, :presence => { :message => "Debe completar el campo Lugar Fisico" }
  validate :reunionMensual

  has_attached_file :adjunto
  validates_attachment :adjunto, presence: true, content_type: { content_type: ["application/pdf", "application/doc", "application/docx","image/jpeg", "image/gif", "image/png", "image/jpg", "image/bmp"] },size: { in: 1..5000.kilobytes }
  accepts_nested_attributes_for :reunion_participantes, allow_destroy: true


end


def reunionMensual
  if (self.semana == nil && self.mes == nil)
     errors.add(:base, 'Debe seleccionar el tipo de reunión, si es semana el nro sino el mes de la misma')
  end
end