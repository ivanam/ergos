class Vendedor < ApplicationRecord

  belongs_to :personas

  has_attached_file :foto, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :foto, :content_type => /\Aimage\/.*\Z/

  validates :numero, :presence => { :message => "Debe completar el campo Número" }
  validates :numero, numericality: { only_integer: true, :message => "El campo Número debe ser un valor entero"}
  validates :numero, :presence => { :message => "Debe completar el campo Fecha" }

  def to_s
  	self.numero
  end
end
