require File.dirname(__FILE__) + '/../test_helper'

class ApplicationTest < Test::Unit::TestCase

  def test_normalisiert
    assert_equal("",
                 "".normalisiert)
    assert_equal("idem",
                 "idem".normalisiert)
    assert_equal("idem",
                 "IDEM".normalisiert)
    assert_equal("ae",
                 "ä".normalisiert)
    assert_equal("ae",
                 "Ä".normalisiert)
    assert_equal("oe",
                 "ö".normalisiert)
    assert_equal("oe",
                 "Ö".normalisiert)
    assert_equal("ue",
                 "ü".normalisiert)
    assert_equal("ue",
                 "Ü".normalisiert)
    assert_equal("ss",
                 "ß".normalisiert)
    assert_equal("falsches ueben von xylophonmusik quaelt jeden groesseren zwerg",
                 "Falsches Üben von Xylophonmusik quält jeden größeren Zwerg".normalisiert)
  end

  def test_suchmaschinenfreundlich
    assert_equal("falsches-ueben-von-xylophonmusik-quaelt-jeden-groesseren-zwerg",
                 "Falsches Üben von Xylophonmusik quält jeden größeren Zwerg".suchmaschinenfreundlich)
  end

  def test_html_datum
    datum = Time.parse("2008-02-24 12:11:04")
    assert_equal("24. Februar 2008, 12:11", datum.html_datum)
    datum = Time.parse("2008-03-01")
    assert_equal("1. M&auml;rz 2008, 00:00", datum.html_datum)
  end

end
