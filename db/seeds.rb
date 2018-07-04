# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Tipo de documento
# ===================


TipoDocumento.create(descripcion: 'LE')#1
TipoDocumento.create(descripcion: 'LC')#2
TipoDocumento.create(descripcion: 'DNI')#3
TipoDocumento.create(descripcion: 'CI')#4

# Tipo de objetivo
# ===================

TipoObjetivo.create(id: 3, descripcion: 'CSI', periodo: 'M')#5
TipoObjetivo.create(id: 4, descripcion: 'PRUEBA DE MANEJO', tipo: 'KPI', periodo: 'SM')#1
TipoObjetivo.create(id: 5, descripcion: 'VENTAS', tipo: 'KPI', periodo: 'SM')#2
TipoObjetivo.create(id: 6, descripcion: 'COMPROMISO DE VENTAS SEMANAL', periodo: 'S')#3
TipoObjetivo.create(id: 7, descripcion: 'OPORTUNIDADES', tipo: 'KPI', periodo: 'SM')
TipoObjetivo.create(id: 8, descripcion: 'FINANCIACIONES', tipo: 'KPI', periodo: 'SM')


# Personas
# ========


Persona.create!(tipo_documento_id: 3,cuit: 20313432098, numero_documento: 31343209,apellido: "Cerrutti", nombre: "German", telefono: "0280154336704", email: "gcerrutti@gmail.com", fecha_nacimiento: Date.new(1979,07,10))


# Usuarios
# ========


User.create(email: 'gcerrutti@gmail.com', password: '12345678', persona_id: 1)#1


# Roles
# ========

Role.create(name: 'vendedor')
Role.create(name: 'punto_venta')
Role.create(name: 'concesionaria')
Role.create(name: 'admin')

# Asignando Roles
# ================

User.find(1).add_role :admin


# Creando Estados Personas
# ================

Estado.create(nombre: 'L', descripcion: 'Libre-Franco')#1
Estado.create(nombre: 'V', descripcion: 'Vacaciones')#2
Estado.create(nombre: 'A', descripcion: 'Ausente')#3