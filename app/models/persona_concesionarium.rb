class PersonaConcesionarium < ApplicationRecord
  belongs_to :persona, :foreign_key => 'persona_id', :class_name => 'Persona'
  belongs_to :concesionaria, :foreign_key => 'concesionaria_id', :class_name => 'Concesionarium'

  validates :persona_id, uniqueness: { message: "ya existe usuario para esa persona" }

  before_create :habilitar_user
  before_destroy :deshabilitar_user

  def habilitar_user
    #Cuando se crea la relacion de la persona con la concesionaria se le genera un usuario y se le asigna el rol CONCESIONARIA
    #Si el usuario existe le agrega el rol CONCESIONARIA
  	usuario = User.new(email: self.persona.email, password: "12345678", persona_id: self.persona.id, concesionaria_id: self.concesionaria_id)
  	if usuario.save
  		usuario.add_role("concesionaria")
  	else
  		usuario = User.where(email: self.persona.email).first
      usuario.update(concesionaria_id: self.concesionaria_id)
  		usuario.add_role("concesionaria")
  	end
  end

  def deshabilitar_user
    #Cuando se borra la relacion se quita el rol CONCESIONARIA al usuario
    usuario = User.where(email: self.persona.email).first
    usuario.remove_role("concesionaria")
  end

end
