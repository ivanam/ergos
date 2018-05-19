class Vendedor < ApplicationRecord

  belongs_to :persona, optional: true
  belongs_to :punto_venta, :foreign_key => 'punto_venta_id', :class_name => 'PuntoVentum'

  #validates_attachment_presence :foto
  has_attached_file :foto, styles: { medium: "300x250>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :foto, content_type: /\Aimage/
  validates_attachment_file_name :foto, matches: [/png\Z/, /jpe?g\Z/]
  validates_attachment_size :foto, less_than_or_equal_to: 4.megabytes


  validates :numero, :uniqueness => {:message => "debe ser único"}
  validates :numero, :presence => { :message => "Debe completar el campo Número" }
  validates :numero, numericality: { only_integer: true, :message => "El campo Número debe ser un valor entero"}
  validates :fecha_alta, :presence => { :message => "Debe completar el campo Fecha" }
 

  before_create :habilitar_user
  before_destroy :deshabilitar_user



  def to_s
  	self.numero
  end



  def next
    self.class.where("id > ?", id).where(:punto_venta_id => self.punto_venta_id).first
  end

  def previous
    self.class.where("id < ?", id).where(:punto_venta_id => self.punto_venta_id).last
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


  def carga_trimestral(anio, mes)
    total = 0
    fecha_desde = Date.new(anio,mes-3,1)
    fecha_hasta = Date.new(anio,mes-1,31)
    CargaDiarium.where('fecha >= "'+fecha_desde.to_s+'" and fecha <= "'+fecha_hasta.to_s+'"' ).where(vendedor_id: vendedor_id).each do |c_d|
      total = total + c_d.cantidad
    end
    return total
  end

end
