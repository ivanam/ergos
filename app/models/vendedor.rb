class Vendedor < ApplicationRecord

  belongs_to :persona, optional: true
  belongs_to :punto_venta, :foreign_key => 'punto_venta_id', :class_name => 'PuntoVentum'

  has_attached_file :foto, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  #validates_attachment_content_type :foto, :content_type => /\Aimage\/.*\Z/

  validates :numero, :presence => { :message => "Debe completar el campo Número" }
  validates :numero, numericality: { only_integer: true, :message => "El campo Número debe ser un valor entero"}
  validates :fecha_alta, :presence => { :message => "Debe completar el campo Fecha" }
  validate :numero_unico
  before_create :habilitar_user
  before_destroy :deshabilitar_user



  def to_s
  	self.numero
  end

  def numero_unico
    if Vendedor.where(:numero => self.numero).first
      errors.add("No se puede dar de alta , ya que existe un vendedor con ese Número")        
    end
  end


  def next
    self.class.where("id > ?", id).first
  end

  def previous
    self.class.where("id < ?", id).last
  end


  def habilitar_user
  
    usuario = User.new(email: self.persona.email, password: "12345678", persona_id: self.persona.id, punto_venta_id: self.punto_venta_id, concesionaria_id: self.punto_venta.concesionaria_id)
    if usuario.save
      usuario.add_role("vendedor")
    else
      usuario = User.where(email: self.persona.email).first
      usuario.update(punto_venta_id: self.punto_venta_id, concesionaria_id: self.punto_venta.concesionaria_id)
      usuario.add_role("vendedor")
    end
  end

  def deshabilitar_user
    usuario = User.where(email: self.persona.email).first
    usuario.remove_role("vendedor")
  end


end
