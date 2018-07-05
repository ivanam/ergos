class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :persona, optional: true

  belongs_to :concesionaria, :foreign_key => 'concesionaria_id', :class_name => 'Concesionarium', optional: true
  
  belongs_to :punto_venta, :foreign_key => 'punto_venta_id', :class_name => 'PuntoVentum', optional: true

  after_update :consistencia_mail

  has_many :notifications, foreign_key: :recipient_id

  #has_many :carga_diaria
  
  def notification_to_s
      ""
  end
  def admin?
		has_role?(:admin)
	end

  def punto_venta?
    has_role?(:admin) or has_role?(:punto_venta)
  end

	def concesionaria?
		has_role?(:admin) or has_role?(:concesionaria)
	end

  def consistencia_mail
    persona = Persona.where(id: self.persona_id).first
    if !persona.nil?
      if persona.email != self.email
        Persona.where(id: self.persona_id).first.update(email: self.email)
      end
    end
  end

  def to_s
    "#{self.email}"
  end
end
