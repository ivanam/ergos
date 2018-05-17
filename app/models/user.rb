class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :persona, optional: true

  belongs_to :concesionaria, :foreign_key => 'concesionaria_id', :class_name => 'Concesionarium', optional: true
  
  belongs_to :punto_venta, :foreign_key => 'punto_venta_id', :class_name => 'PuntoVentum', optional: true
  
  def admin?
		has_role?(:admin)
	end

	def concesionaria?
		has_role?(:admin) or has_role?(:concesionaria)
	end

  def to_s
    "#{self.email}"
  end
end
