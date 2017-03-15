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

ActiveRecord::Schema.define(version: 20170314232303) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "admins", force: :cascade do |t|
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
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "chofers", primary_key: "cedula", id: :integer, force: :cascade do |t|
    t.string   "nombres",                      null: false
    t.string   "apellidos",                    null: false
    t.date     "fechaNacimiento",              null: false
    t.string   "tipoLicencia",                 null: false
    t.text     "experiencia",     default: ""
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "avatar"
    t.string   "direccion"
    t.string   "email"
    t.integer  "telefono"
    t.json     "licencias"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "facturas", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "emisor"
    t.integer  "numero"
    t.integer  "id_orden_combustible"
    t.integer  "id_orden_respuesto"
    t.integer  "id_orden_mantenimiento"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "avatar"
    t.text     "observaciones"
  end

  create_table "orden_combustibles", force: :cascade do |t|
    t.string   "estacionServicio"
    t.string   "vehiculo_placa"
    t.date     "fechaEmision"
    t.string   "tipoCombustible"
    t.decimal  "valorCompra"
    t.string   "persona"
    t.integer  "cedula"
    t.string   "cargo"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "orden_mantenimientos", force: :cascade do |t|
    t.string   "vehiculo_placa"
    t.string   "tipo"
    t.integer  "kilometraje"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "encargado"
    t.integer  "cedula"
    t.string   "cargo"
    t.text     "detalle"
  end

  create_table "orden_repuestos", force: :cascade do |t|
    t.date     "fecha"
    t.string   "encargado"
    t.string   "proveedor"
    t.text     "observaciones"
    t.string   "vehiculo_placa"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "detalle"
    t.string   "avatar"
    t.integer  "cedula"
    t.string   "cargo"
  end

  create_table "prestamos", force: :cascade do |t|
    t.date     "fechaEntrega"
    t.date     "fechaDevolucion"
    t.text     "razon"
    t.text     "observaciones"
    t.integer  "user_cedula"
    t.string   "vehiculo_placa"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "approved",        default: false, null: false
    t.string   "cargo"
    t.string   "departamento"
    t.boolean  "chofer"
    t.integer  "chofer_cedula"
    t.boolean  "rechazado",       default: false
  end

  create_table "users", primary_key: "cedula", id: :integer, force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "last_name"
    t.integer  "telephone"
    t.string   "charge"
    t.string   "department"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "approved",               default: false, null: false
    t.index ["approved"], name: "index_users_on_approved", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vehiculos", primary_key: "placa", id: :string, force: :cascade do |t|
    t.string   "marca"
    t.string   "modelo"
    t.string   "color"
    t.string   "tipo"
    t.integer  "anio"
    t.integer  "kilometraje"
    t.integer  "capacidadPasajeros"
    t.decimal  "capacidadCarga"
    t.text     "observaciones"
    t.boolean  "disponibilidad",     default: true, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "traccion",           default: "",   null: false
    t.json     "avatars"
    t.string   "nro_chasis"
    t.integer  "cilindraje"
    t.boolean  "mantenimiento"
  end

end
