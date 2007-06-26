class Autorenlinks < ActiveRecord::Migration
# Autorenlinks, Homepage, (DE|EN|FR)-Wikipedia, http://www.fictionfantasy.de/, www.dsfdb.org
#
# Typ kann sein:
# homepage,
# wikipedia_(en|de|fr|it), fictionfantasy.de, dsfdb.org, isfdb.org
# gutenberg.spiegel.de, gutenberg.org http://www.gutenberg.org/author/Bellamy+Edward
# sonstiges z.B. Frank Borsch Alien Earth

  def self.up
		  execute "create table Autorenlinks (\n"+ 
										" id integer primary key,\n"+ 
										" url text,\n"+ 
										" typ text, \n"+ 
										" beschreibung text,\n"+ 
										" autor_id integer,\n"+ 
										" FOREIGN KEY(autor_id) REFERENCES autoren(id))" 
  end

  def self.down
	  drop_table :autorenlinks
  end
end
