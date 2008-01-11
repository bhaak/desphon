class Onlinetexte < ActiveRecord::Migration

# Text :: Autor, Titel,  Buchtitel, Verlag, ISBN/ISSN, publiziert?, wann jahr, Originalsprache?,
#         ??? Beschreibungslink, Direktlink, welchenAnzeigen,
#         Format,
#         Typ ({Horror, Fantasy, SF} \elem Phantastik)
#         EmpfohlenerLink (als Indikator, ob dieser Text auf der HP als featured link erscheinen darf)
#         Zyklus? wie "Perry Rhodan: Auf der Suche nach der verlorenen Menschheit"
#
  def self.up
    execute "create table Onlinetexte (\n"+ 
									" id integer primary key,\n"+ 
									" titel text,\n"+ 
									" buchtitel text,\n"+ 
									" verlag text,\n"+ 
									" isbn_issn text,\n"+ 
									" jahr integer,\n"+ 
									" sprache text,\n"+ 
									" originalsprache text,\n"+ 
									" beschreibungslink text,\n"+ 
									" empfohlener_link boolean,\n"+ 
									" beschreibung text,\n"+ 
									" created_at timestamptz,\n"+ 
									" updated_at timestamptz\n"+ 
									")" 
  end

  def self.down
	  drop_table :onlinetexte
  end
end
