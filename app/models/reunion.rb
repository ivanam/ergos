class Reunion < ApplicationRecord
	belongs_to :persona
	has_many :reunion_participantes, :foreign_key => 'reunion_id', :class_name => 'ReunionParticipante'

	validates :fecha, :presence => { :message => "Debe completar el campo Fecha" }
	validates :semana, :presence => { :message => "Debe completar el campo Semana" }, :if => :reunion_semanal?
  validates :mes, :presence => { :message => "Debe completar el campo Mes" }
	validates :lugar_fisico, :presence => { :message => "Debe completar el campo Lugar Fisico" }
  validate :reunion_mensual_o_semanal
  validate :evitar_duplicados

  has_attached_file :adjunto
  validates_attachment_presence :adjunto, message: "Debe adjuntar un archivo"
  validates_attachment :adjunto, 
    content_type: { content_type: ["application/pdf", "application/doc", "application/docx","image/jpeg", "image/gif", "image/png", "image/jpg", "image/bmp"], message: "La extension del archivo no es correcta" },
    size: { in: 1..5000.kilobytes, message: "El archivo adjunto supera los 5MB" }
  accepts_nested_attributes_for :reunion_participantes, allow_destroy: true

  #Devuelve verdadero si se trata de una reunion semanal falso en caso contrario
  def reunion_semanal?
    !self.mensual
  end

  #Valida que no se pueda repetir el vendedor al crear una nueva reunion
  def evitar_duplicados

    personas_ids = self.reunion_participantes.map(&:persona_id)
    personas_ids_unicas = personas_ids.uniq
    if (personas_ids.length != personas_ids_unicas.length)
      errors.add(:base, 'No puede repetir el Vendedor')
    end
  end

  #Valida que se seleccione un tipo de reunion al crear una nueva reunion
  def reunion_mensual_o_semanal
    if (self.semana == nil && self.mes == nil)
       errors.add(:base, 'Debe seleccionar el tipo de reunión, si es semana el nro sino el mes de la misma')
    end
  end

end
