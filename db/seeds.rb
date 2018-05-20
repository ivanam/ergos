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

TipoObjetivo.create(descripcion: 'PRUEBA DE MANEJO', tipo: 'KPI')#1
TipoObjetivo.create(descripcion: 'VENTAS', tipo: 'KPI')#2
TipoObjetivo.create(descripcion: 'COMPROMISO DE VENTAS SEMANAL',)#3
TipoObjetivo.create(descripcion: 'OPORTUNIDADES', tipo: 'KPI')#4

# Personas
# ========


Persona.create!(tipo_documento_id: 3, numero_documento: 31343209,apellido: "Cerrutti", nombre: "German", telefono: "0280154336704", email: "gcerrutti@gmail.com", fecha_nacimiento: Date.new(1979,07,10))


# Usuarios
# ========


User.create(email: 'admin@admin.com', password: 'sumbudrule', persona_id: 1)#1


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

EstadoPersona.create(estado: 'L', descripcion: 'Libre-Franco')#1
EstadoPersona.create(estado: 'V', descripcion: 'Vacaciones')#2
EstadoPersona.create(estado: 'A', descripcion: 'Ausente')#3