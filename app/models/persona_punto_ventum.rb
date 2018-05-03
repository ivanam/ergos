class PersonaPuntoVentum < ApplicationRecord
  belongs_to :persona
  belongs_to :punto_venta, :foreign_key => 'punto_venta_id', :class_name => 'PuntoVentum'


  validates :persona_id, uniqueness: { message: "ya existe usuario para esa persona" }

  before_create :habilitar_user
  before_destroy :deshabilitar_user

  def habilitar_user
  	usuario = User.new(email: self.persona.email, password: "12345678", persona_id: self.persona.id, punto_venta_id: self.punto_venta_id, concesionaria_id: self.punto_venta.concesionaria_id)
  	if usuario.save
  		usuario.add_role("punto_venta")
  	else
  		usuario = User.where(email: self.persona.email).first
      usuario.update(punto_venta_id: self.punto_venta_id, concesionaria_id: self.punto_venta.concesionaria_id)
  		usuario.add_role("punto_venta")
  	end
  end

  def deshabilitar_user
    usuario = User.where(email: self.persona.email).first
    usuario.remove_role("punto_venta")
  end
end
