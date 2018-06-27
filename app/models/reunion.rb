class Reunion < ApplicationRecord
	belongs_to :persona
	has_many :reunion_participantes, :foreign_key => 'reunion_id', :class_name => 'ReunionParticipante'

	validates :fecha, :presence => { :message => "Debe completar el campo Fecha" }
	# validates :semana, :presence => { :message => "Debe completar el campo Semana" }
  # validates :semana, numericality: { only_integer: true, :message => "El campo Semana debe ser un valor entero"}
  # validates :semana, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 4, :message => "El campo semana debe ser un valor entre 1 y 4"}
	validates :lugar_fisico, :presence => { :message => "Debe completar el campo Lugar Fisico" }
  validate :reunionMensual

  has_attached_file :adjunto
  validates_attachment :adjunto, content_type: { content_type: ["application/pdf", "application/doc", "application/docx","image/jpeg", "image/gif", "image/png", "image/jpg", "image/bmp"] },size: { in: 1..5000.kilobytes }
  accepts_nested_attributes_for :reunion_participantes, allow_destroy: true

  validate :check_duplicados

  def check_duplicados
    personas_ids = self.reunion_participantes.map(&:persona_id)
    personas_ids_unicas = personas_ids.uniq
    if (personas_ids.length != personas_ids_unicas.length)
      errors.add(:base, 'No puede repetir el Vendedor')
    end
  end

  def reunionMensual
    if (self.semana == nil && self.mes == nil)
       errors.add(:base, 'Debe seleccionar el tipo de reunión, si es semana el nro sino el mes de la misma')
    end
  end

end
