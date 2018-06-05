# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180605004829) do

  create_table "carga_diaria", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "fecha"
    t.integer  "cantidad"
    t.integer  "tipo_objetivo_id"
    t.integer  "vendedor_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "concesionaria", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.binary   "icono",             limit: 65535
    t.string   "nombre"
    t.date     "fecha_alta"
    t.date     "fecha_baja"
    t.integer  "user_id"
    t.integer  "empresa_id"
    t.integer  "persona_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "cantPv"
    t.integer  "cantVend"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "estado_personas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "persona_id"
    t.date     "fecha_inicio"
    t.datetime "fecha_fin"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "vendedor_id"
    t.integer  "estado_id"
    t.index ["persona_id"], name: "index_estado_personas_on_persona_id", using: :btree
  end

  create_table "estados", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "objetivo_mensuals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "descripcion"
    t.date     "fecha_creacion"
    t.integer  "tipo_objetivo_id"
    t.integer  "cantidad_propuesta"
    t.integer  "mes"
    t.integer  "anio"
    t.integer  "user_id"
    t.integer  "vendedor_id"
    t.integer  "punto_venta_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "csi_real"
  end

  create_table "objetivo_semanals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "objetivo_mensual_id"
    t.date     "fecha_creacion"
    t.integer  "cantidad_propuesta"
    t.integer  "numero_semana"
    t.integer  "user_id"
    t.integer  "vendedor_id"
    t.integer  "punto_venta_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "tipo_objetivo_id"
    t.integer  "mes"
    t.integer  "anio"
  end

  create_table "persona_concesionaria", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "persona_id"
    t.integer  "concesionaria_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["concesionaria_id"], name: "index_persona_concesionaria_on_concesionaria_id", using: :btree
    t.index ["persona_id"], name: "index_persona_concesionaria_on_persona_id", using: :btree
  end

  create_table "persona_punto_venta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "persona_id"
    t.integer  "punto_venta_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["persona_id"], name: "index_persona_punto_venta_on_persona_id", using: :btree
    t.index ["punto_venta_id"], name: "index_persona_punto_venta_on_punto_venta_id", using: :btree
  end

  create_table "personas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "tipo_documento_id"
    t.integer  "numero_documento"
    t.bigint   "cuit"
    t.string   "apellido"
    t.string   "nombre"
    t.string   "domicilio"
    t.string   "telefono"
    t.string   "email"
    t.date     "fecha_nacimiento"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "punto_venta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.string   "domicilio"
    t.integer  "concesionaria_id"
    t.integer  "persona_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "reunion_participantes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "reunion_id"
    t.integer  "persona_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reunions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "fecha"
    t.integer  "semana"
    t.string   "lugar_fisico"
    t.integer  "persona_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "plan_accion"
    t.string   "accion"
    t.binary   "adjunto",              limit: 65535
    t.string   "adjunto_file_name"
    t.string   "adjunto_content_type"
    t.integer  "adjunto_file_size"
    t.datetime "adjunto_updated_at"
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id", using: :btree
  end

  create_table "tipo_documentos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tipo_objetivos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "tipo"
    t.string   "periodo"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "persona_id"
    t.integer  "concesionaria_id"
    t.integer  "punto_venta_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id", using: :btree
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
    t.index ["user_id"], name: "index_users_roles_on_user_id", using: :btree
  end

  create_table "vendedors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.binary   "foto",              limit: 65535
    t.string   "numero"
    t.date     "fecha_alta"
    t.date     "fecha_baja"
    t.integer  "persona_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "punto_venta_id"
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.integer  "avance"
  end

  add_foreign_key "estado_personas", "personas"
  add_foreign_key "persona_concesionaria", "concesionaria", column: "concesionaria_id"
  add_foreign_key "persona_concesionaria", "personas"
  add_foreign_key "persona_punto_venta", "personas"
  add_foreign_key "persona_punto_venta", "punto_venta", column: "punto_venta_id"
end
