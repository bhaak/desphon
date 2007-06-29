class Onlinetextelinks < ActiveRecord::Migration
  def self.up
    execute "CREATE TABLE Onlinetextelinks (\n"+
      "id integer primary key,\n"+
      "onlinetext_id integer,\n"+
 
      "url text,\n"+ # direkter Link zum Text
      "url_beschreibung text,\n"+ # angezeigter Text fuer url

      "uebersichtsurl text,\n"+ # Link zur Uebersichtsseite des Textes
      "uebersichtsurl_beschreibung text,\n"+ # angezeigter Text fuer uebersichtsurl

      "mime_typ text, \n"+ # z.B. image/png, text/plain

      "created_at timestamptz,\n"+
      "updated_at timestamptz)\n"
  end

  def self.down
	  drop_table :onlinetextelinks
  end
end
