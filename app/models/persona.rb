class Persona < ApplicationRecord

	has_many :vendedors
	belongs_to :tipo_documento
  has_many :reunion_participantes, :foreign_key => 'persona_id', :class_name => 'ReunionParticipante'
  has_many :reunions, :through => :reunion_participantes
  has_one :user

  validates :numero_documento, :presence => { :message => "Debe completar el campo Número de documento" }
  validates :numero_documento, numericality: { only_integer: true, :message => "El campo Número de documento debe ser un valor entero"}
  validates :numero_documento, length: {minimum: 7, maximum: 11, :message => "El campo Número de documento debe tener 7 u 11 dígitos"}
  validates :apellido, :presence => { :message => "Debe completar el campo Apellido" }
  validates :apellido, :format => {:with => /\A[a-z ñáéíóúü'A-ZÑÁÉÍÓÚÜ]+\z/, :message => "El campo Apellido sólo debe contener letras" }
  validates :nombre, :presence => { :message => "Debe completar el campo Nombre" }
  validates :nombre, :format => {:with => /\A[a-z ñáéíóúü'A-ZÑÁÉÍÓÚÜ]+\z/, :message => "El campo Nombre sólo debe contener letras" }
  validates :telefono, :presence => { :message => "Debe completar el campo Teléfono" }
  validates :fecha_nacimiento, presence: { :message => "Fecha nacimiento no puede estar vacio"}

  validates :email, :presence => { :message => "Debe completar el campo Email" }
  validates :email, :format => {:with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, :message => "El campo Email debe contener una dirección de correo válida"}

  validates :cuit, :presence => { :message => "Debe completar el campo CUIL" }

  validates_uniqueness_of :cuit, :message=>"ya fue utilizado por otra persona" 
  validates_uniqueness_of :email, :message=>"ya fue utilizado por otra persona" 


  before_destroy :deshabilitar_user

  before_update :consistencia_mail




  def estado_vend
    self.vendedor.estado_personas.each do |e_p|
      f_i = e_p.fecha_inicio
      if e_p.fecha_fin == nil
        f_f = Date.new(3000,f_i.month,f_i.day)
      else
        f_f = e_p.fecha_fin
      end
      if self.fecha.to_date >= f_i and self.fecha.to_date <= f_f
        errors.add(:base, "No puede realizar la carga")
        return 0
      end
    end
  end



  def to_s
    "#{self.apellido}, #{self.nombre}"
  end

  def to_s_comp
    "#{self.apellido}, #{self.nombre}, #{self.numero_documento}"
  end

  def age(dob)
    if dob != nil
      now = Date.today
      now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    end
  end

  def consistencia_mail
    User.where(persona_id: self.id).first.update(email: self.email)
  end


  def deshabilitar_user
    usuario = User.where(email: self.email).first
    if !usuario.nil?
      usuario.remove_role("admin")
      usuario.delete
    end
  end

end
  