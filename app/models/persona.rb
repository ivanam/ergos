class Persona < ApplicationRecord
	has_many :vendedors 
	belongs_to :tipo_documentos

  validates :numero_documento, :presence => { :message => "Debe completar el campo Número de documento" }
  validates :numero_documento, numericality: { only_integer: true, :message => "El campo Número de documento debe ser un valor entero"}
  validates :numero_documento, length: {minimum: 7, maximum: 11, :message => "El campo Número de documento debe tener 7 u 11 dígitos"}
  validates :apellido, :presence => { :message => "Debe completar el campo Apellido" }
  validates :apellido, :format => {:with => /\A[a-z ñáéíóúü'A-ZÑÁÉÍÓÚÜ]+\z/, :message => "El campo Apellido sólo debe contener letras" }
  validates :nombre, :presence => { :message => "Debe completar el campo Nombre" }
  validates :nombre, :format => {:with => /\A[a-z ñáéíóúü'A-ZÑÁÉÍÓÚÜ]+\z/, :message => "El campo Nombre sólo debe contener letras" }
  validates :telefono, :presence => { :message => "Debe completar el campo Teléfono" }
  validates :telefono, numericality: { only_integer: true, :message => "El campo Teléfono debe ser un valor entero"}
  validates :telefono, length: {minimum: 11, maximum: 13, :message => "El campo Teléfono debe tener entre 11 y 13 dígitos"}
  validates :email, :presence => { :message => "Debe completar el campo Email" }
  validates :email, :format => {:with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, :message => "El campo Email debe contener una dirección de correo válida"}
	
end
