ActiveRecord::Schema.define(version: 20210921074150) do

  create_table "courses", force: :cascade do |t|
    t.string   "name",          limit: 255,          null: false
    t.text     "description",   limit: 65535
    t.datetime "created_at",           precision: 3
    t.datetime "updated_at",           precision: 3
  end

  create_table "tutors", force: :cascade do |t|
    t.string   "name",          limit: 255,          null: false
    t.text     "qualification",   limit: 255
    t.datetime "created_at",           precision: 3
    t.datetime "updated_at",           precision: 3
  end

  add_index "tutors", ["course_id"], name: "index_tutors_on_course_id", using: :btree
end
