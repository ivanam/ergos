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

TipoObjetivo.create(descripcion: 'PRUEBA DE MANEJO')#1
TipoObjetivo.create(descripcion: 'VENTAS')#2
TipoObjetivo.create(descripcion: 'COMPROMISO DE VENTAS SEMANAL')#3
TipoObjetivo.create(descripcion: 'OPORTUNIDADES')#4

# Personas
# ========

Persona.create(tipo_documento_id: 3, numero_documento: 31343209,apellido: "Litterio", nombre: "Marcos", telefono: "0280154336704", email: "marcos0@gmail.com")
Persona.create(tipo_documento_id: 3, numero_documento: 32343209,apellido: "Moyano", nombre: "Ivana", telefono: "0280154336457", email: "ivana@gmail.com")
Persona.create(tipo_documento_id: 3, numero_documento: 33343209,apellido: "Pritzkler", nombre: "Gonzalo", telefono: "0280154336367", email: "gonzalo@gmail.com")
Persona.create(tipo_documento_id: 3, numero_documento: 33343209,apellido: "Moreno", nombre: "Martin", telefono: "0280154336367", email: "martin@gmail.com")


# Usuarios
# ========

User.create(email: 'vendedor@vendedor.com', password: 'sumbudrule', persona_id: 1)#1
User.create(email: 'jefe@jefe.com', password: 'sumbudrule', persona_id: 2)#2
User.create(email: 'admin@admin.com', password: 'sumbudrule', persona_id: 3)#3
User.create(email: 'vendedor2@vendedor.com', password: 'sumbudrule', persona_id: 4)#4
User.create(email: 'concesionaria@concesionaria.com', password: 'sumbudrule', persona_id: 5)#5

# Roles
# ========

Role.create(name: 'vendedor')
Role.create(name: 'punto_venta')
Role.create(name: 'concesionaria')
Role.create(name: 'admin')

# Asignando Roles
# ================

User.find(1).add_role :vendedor
User.find(2).add_role :punto_venta
User.find(3).add_role :admin
User.find(4).add_role :vendedor
User.find(5).add_role :concesionaria

# Creando Estados Personas
# ================

EstadoPersona.create(estado: 'L', descripcion: 'Libre-Franco')#1
EstadoPersona.create(estado: 'V', descripcion: 'Vacaciones')#2
EstadoPersona.create(estado: 'A', descripcion: 'Ausente')#3