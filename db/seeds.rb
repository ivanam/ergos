# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Tipo de documento
# ===================

TipoDocumento.create(descripcion: 'CUIT') #1
TipoDocumento.create(descripcion: 'LE')#2
TipoDocumento.create(descripcion: 'LC')#3
TipoDocumento.create(descripcion: 'DNI')#4
TipoDocumento.create(descripcion: 'CI')#5

# Tipo de objetivo
# ===================

TipoObjetivo.create(descripcion: 'PROSPECTOS') #1
TipoObjetivo.create(descripcion: 'PRUEBA DE MANEJO')#2
TipoObjetivo.create(descripcion: 'VENTAS')#2
