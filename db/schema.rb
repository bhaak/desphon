# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 9) do

  create_table "Autoren", :force => true do |t|
    t.text      "vorname"
    t.text      "nachname"
    t.integer   "geburtsjahr"
    t.integer   "geburtsmonat"
    t.integer   "geburtstag"
    t.integer   "todesjahr"
    t.integer   "todesmonat"
    t.integer   "todestag"
    t.boolean   "geburtsjahr_gesichert", :default => true
    t.boolean   "todesjahr_gesichert",   :default => true
    t.text      "geburtsort"
    t.text      "todesort"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "Autoren_Onlinetexte", :id => false, :force => true do |t|
    t.integer "autor_id"
    t.integer "onlinetext_id"
  end

  create_table "Autorenlinks", :force => true do |t|
    t.text      "url"
    t.text      "typ"
    t.text      "beschreibung"
    t.integer   "autor_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "Onlinetextelinks", :force => true do |t|
    t.integer   "onlinetext_id"
    t.text      "url"
    t.text      "uebersichtsurl"
    t.text      "mime_typ"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.text      "url_beschreibung"
    t.text      "uebersichtsurl_beschreibung"
  end

  add_index "Onlinetextelinks", ["onlinetext_id", "id", "url", "uebersichtsurl", "mime_typ", "created_at", "updated_at"], :name => "onlinetextelinks_idx"

  create_table "comatose_pages", :force => true do |t|
    t.integer  "parent_id"
    t.text     "full_path",                 :default => ""
    t.string   "title"
    t.string   "slug"
    t.string   "keywords"
    t.text     "body"
    t.string   "filter_type", :limit => 25, :default => "Textile"
    t.string   "author"
    t.integer  "position",                  :default => 0
    t.integer  "version"
    t.datetime "updated_on"
    t.datetime "created_on"
  end

  create_table "onlinetexte", :force => true do |t|
    t.text     "titel"
    t.text     "buchtitel"
    t.text     "verlag"
    t.text     "isbn_issn"
    t.integer  "jahr"
    t.text     "sprache"
    t.text     "originalsprache"
    t.text     "beschreibungslink"
    t.text     "format"
    t.text     "typ"
    t.boolean  "empfohlener_link"
    t.text     "beschreibung"
    t.integer  "autor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "uebersetzer"
    t.text     "kommentar"
    t.text     "serie"
  end

  create_table "page_versions", :force => true do |t|
    t.integer  "page_id"
    t.integer  "version"
    t.integer  "parent_id"
    t.text     "full_path",                 :default => ""
    t.string   "title"
    t.string   "slug"
    t.string   "keywords"
    t.text     "body"
    t.string   "filter_type", :limit => 25, :default => "Textile"
    t.string   "author"
    t.integer  "position",                  :default => 0
    t.datetime "updated_on"
    t.datetime "created_on"
  end

end
