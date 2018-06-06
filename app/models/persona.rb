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

  validates :cuil, :presence => { :message => "Debe completar el campo CUIL" }
  validates :cuil, uniqueness: true

  before_destroy :deshabilitar_user


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


  def deshabilitar_user
    usuario = User.where(email: self.email).first
    if !usuario.nil?
      usuario.remove_role("admin")
      usuario.delete
    end
  end

end
  