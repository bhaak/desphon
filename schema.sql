# Text :: Autor, Titel,  Buchtitel, Verlag, ISBN/ISSN, publiziert?, wann jahr, Originalsprache?,
#         ??? Beschreibungslink, Direktlink, welchenAnzeigen,
#         Format,
#         Typ ({Horror, Fantasy, SF} \elem Phantastik)
#         EmpfohlenerLink (als Indikator, ob dieser Text auf der HP als featured link erscheinen darf)
#         Zyklus? wie "Perry Rhodan: Auf der Suche nach der verlorenen Menschheit"
# 
# Autor :: Vorname, Nachname, Geburts-, Todesjahr, Geburtsjahr gesichert, Todesjahr gesichert,
#          Geburtstag, Todestag, Geburtsort, Todesort
#
# Autorenlinks, Homepage, (DE|EN|FR)-Wikipedia, http://www.fictionfantasy.de/, www.dsfdb.org

-- drop table Onlinetexte;
create table Onlinetexte (
	id integer primary key,
	titel text,
	buchtitel text,
	verlag text,
	isbn_issn text,
	jahr integer,
	sprache text,
	originalsprache text,
	beschreibungslink text,
	format text,
	typ text,
	empfohlener_link boolean,
	beschreibung text,
	autor_id integer,
	created_at timestamptz,
	updated_at timestamptz,
	FOREIGN KEY(autor_id) REFERENCES autoren(id));

--insert into onlinetexte (id, titel, jahr, sprache, originalsprache) values (1, 'test',  1992, 'deutsch', 'deutsch');
--insert into onlinetexte (id, titel, jahr, sprache, originalsprache) values (2, 'test2', 2001, 'deutsch', 'deutsch');
--insert into onlinetexte (id, titel, jahr, sprache, originalsprache) values (3, 'test3', 2000, 'deutsch', 'deutsch');

-- drop table Autoren_Onlinetexte;
create table Autoren_Onlinetexte (
	autor_id integer,
	onlinetext_id integer);


-- drop table Autoren;
create table Autoren (
	id integer primary key,
	vorname text,
	nachname text,
	geburtsjahr int,
	todesjahr int,
	geburtsjahr_gesichert boolean DEFAULT true,
	todesjahr_gesichert boolean DEFAULT true,
	geburtstag date,
	todestag date,
	geburtsort text,
	todesort text,
	created_at timestamptz,
	updated_at timestamptz);

-- drop table Autorenlinks;
create table Autorenlinks (
	id integer primary key,
	url text,
	typ text, 
  beschreibung text,
  autor_id integer,
	FOREIGN KEY(autor_id) REFERENCES autoren(id));
-- Typ kann sein:
-- homepage,
-- wikipedia_(en|de|fr|it), fictionfantasy.de, dsfdb.org, isfdb.org
-- gutenberg.spiegel.de, gutenberg.org http://www.gutenberg.org/author/Bellamy+Edward
-- sonstiges z.B. Frank Borsch Alien Earth
