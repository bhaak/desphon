require File.dirname(__FILE__) + '/../test_helper'

class AutorTest < Test::Unit::TestCase
  fixtures :autoren

  def test_genitiv
    assert_equal("",
                 Autor.find(autoren(:null_autor).id).genitiv)
    assert_equal("",
                 autoren(:null_autor).genitiv)
    assert_equal("Vornames",
                 autoren(:autor_mit_vornamen).genitiv)
    assert_equal("Vorname Nachnames",
                 autoren(:autor_mit_vornamen_und_nachnamen).genitiv)
    assert_equal("Nachnames",
                 autoren(:autor_mit_nachnamen).genitiv)
    assert_equal("Xenophantes'",
                 autoren(:autor_xenophantes).genitiv)
  end
  
  def test_kurzname
    assert_equal("",
                 Autor.find(autoren(:null_autor).id).kurzname)
    assert_equal("",
                 autoren(:null_autor).kurzname)
    assert_equal("Vorname",
                 autoren(:autor_mit_vornamen).kurzname)
    assert_equal("Vorname Nachname",
                 autoren(:autor_mit_vornamen_und_nachnamen).kurzname)
    assert_equal("Nachname",
                 autoren(:autor_mit_nachnamen).kurzname)

    assert_equal("Vorname Nachname",
                 autoren(:autor_vollstaendig_mit_geburtsjahr).kurzname)
    assert_equal("Vorname Nachname",
                 autoren(:autor_vollstaendig_mit_todesjahr).kurzname)
    assert_equal("Vorname Nachname",
                 autoren(:autor_vollstaendig_mit_geburtsjahr_und_todesjahr).kurzname)
    assert_equal("Vorname Nachname",
                 autoren(:autor_vollstaendig_mit_geburtsjahr_und_todesjahr_ungesichert).kurzname)
  end

  def test_zeigeNamen
    assert_equal("",
                 Autor.find(autoren(:null_autor).id).zeigeNamen)
    assert_equal("",
                 autoren(:null_autor).zeigeNamen)
    assert_equal("Vorname",
                 autoren(:autor_mit_vornamen).zeigeNamen)
    assert_equal("Nachname, Vorname",
                 autoren(:autor_mit_vornamen_und_nachnamen).zeigeNamen)
    assert_equal("Nachname",
                 autoren(:autor_mit_nachnamen).zeigeNamen)

    assert_equal("Nachname, Vorname (1900)",
                 autoren(:autor_vollstaendig_mit_geburtsjahr).zeigeNamen)
    assert_equal("Nachname, Vorname (-1950)",
                 autoren(:autor_vollstaendig_mit_todesjahr).zeigeNamen)
    assert_equal("Nachname, Vorname (1900-1950)",
                 autoren(:autor_vollstaendig_mit_geburtsjahr_und_todesjahr).zeigeNamen)
    assert_equal("Nachname, Vorname (1900?-1950?)",
                 autoren(:autor_vollstaendig_mit_geburtsjahr_und_todesjahr_ungesichert).zeigeNamen)
  end

  def test_Datum
    assert_equal("",
                 autoren(:null_autor).zeigeGeburtsdatum)
    assert_equal("",
                 autoren(:autor_mit_vornamen).zeigeGeburtsdatum)
    assert_equal("1900",
                 autoren(:autor_vollstaendig_mit_geburtsjahr).zeigeGeburtsdatum)
    assert_equal("27. November 1900",
                 autoren(:autor_vollstaendig_mit_datum).zeigeGeburtsdatum)
    assert_equal("1900?",
                 autoren(:autor_vollstaendig_mit_geburtsjahr_und_todesjahr_ungesichert).zeigeGeburtsdatum)

    assert_equal("",
                 autoren(:null_autor).zeigeTodesdatum)
    assert_equal("",
                 autoren(:autor_mit_vornamen).zeigeTodesdatum)
    assert_equal("1950",
                 autoren(:autor_vollstaendig_mit_todesjahr).zeigeTodesdatum)
    assert_equal("20. Januar 1950",
                 autoren(:autor_vollstaendig_mit_datum).zeigeTodesdatum)
    assert_equal("1950?",
                 autoren(:autor_vollstaendig_mit_geburtsjahr_und_todesjahr_ungesichert).zeigeTodesdatum)
  end

end
