class Autoren < ActiveRecord::Migration

  # Autor :: Vorname, Nachname, Geburts-, Todesjahr, Geburtsjahr gesichert, Todesjahr gesichert,
  #          Geburtstag, Todestag, Geburtsort, Todesort

  def self.up
    execute "create table Autoren (\n"+ 
								" id integer primary key,\n"+ 
								" vorname text,\n"+ 
								" nachname text,\n"+ 
								" geburtsjahr int,\n"+ 
								" todesjahr int,\n"+ 
								" geburtsjahr_gesichert boolean DEFAULT true,\n"+ 
								" todesjahr_gesichert boolean DEFAULT true,\n"+ 
								" geburtstag date,\n"+ 
								" todestag date,\n"+ 
								" geburtsort text,\n"+ 
								" todesort text,\n"+ 
								" created_at timestamptz,\n"+ 
								" updated_at timestamptz)" 
  end

  def self.down
	  drop_table :autoren
  end
end
