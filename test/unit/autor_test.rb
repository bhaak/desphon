require File.dirname(__FILE__) + '/../test_helper'

class AutorTest < Test::Unit::TestCase
  fixtures :autoren

  # Replace this with your real tests.
  def test_truth
    assert true
  end

  def test_zeigeNamen
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

end
