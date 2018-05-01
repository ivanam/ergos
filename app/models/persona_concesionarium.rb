class PersonaConcesionarium < ApplicationRecord
  belongs_to :persona, :foreign_key => 'persona_id', :class_name => 'Persona'
  #belongs_to :concesionarium, :foreign_key => 'concesionaria_id', :class_name => 'Concesionarium'

  validates :persona_id, uniqueness: { message: "ya existe usuario para esa persona" }

  before_create :habilitar_user
  before_destroy :deshabilitar_user

  def habilitar_user
  	usuario = User.new(email: self.persona.email, password: "12345678", persona_id: self.persona.id)
  	if usuario.save
  		usuario.add_role("concesionaria")
  	else
  		usuario = User.where(email: self.persona.email).first
  		usuario.add_role("concesionaria")
  	end
  end

  def deshabilitar_user
    usuario = User.where(email: self.persona.email).first
    usuario.remove_role("concesionaria")
  end

end
