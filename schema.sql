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

create table 'Texte' (
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
	empfohlener_link boolean);
insert into texte values (1, 'test', 1992, 'deutsch');
insert into texte values (2, 'test2', 2001, 'deutsch');
insert into texte values (3, 'test3', 2000, 'deutsch');

create table 'Autoren' (
	id integer primary key,
	vorname text,
	nachname text,
	geburtsjahr date,
	todesjahr date,
	geburtsjahr_gesichert boolean,
	todesjahr_gesichert boolean,
	geburtstag date,
	todestag date,
	geburtsort text,
	todesort text,
# Autorenlinks, Homepage, (DE|EN|FR)-Wikipedia, http://www.fictionfantasy.de/, www.dsfdb.org

);
