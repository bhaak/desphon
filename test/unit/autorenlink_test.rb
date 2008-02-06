require File.dirname(__FILE__) + '/../test_helper'

class AutorenlinkTest < Test::Unit::TestCase
  fixtures :autoren
  fixtures :autorenlinks

  def test_links
    assert_equal("http://de.wikipedia.org/wiki/Theodor_Herzl",
                 autorenlinks(:de).full_url)
    assert_equal("http://en.wikipedia.org/wiki/Theodor_Herzl",
                 autorenlinks(:en).full_url)
    assert_equal("http://it.wikipedia.org/wiki/Theodor_Herzl",
                 autorenlinks(:it).full_url)
    assert_equal("http://fr.wikipedia.org/wiki/Theodor_Herzl",
                 autorenlinks(:fr).full_url)
    assert_equal("http://www.gutenberg.org/author/Edward_Bellamy",
                 autorenlinks(:gutenberg_org).full_url)
    assert_equal("http://gutenberg.spiegel.de/autoren/herzl.htm",
                 autorenlinks(:gutenberg_spiegel_de).full_url)
    assert_equal("http://www.fictionfantasy.de/load.php?name=News&file=article&sid=3989",
                 autorenlinks(:fictionfantasy_de).full_url)

    assert_equal("http://link_ohne_http.invalid",
                 autorenlinks(:link_ohne_http).full_url)
    assert_equal("http://Theodor_Herzl",
                 autorenlinks(:unbekannt).full_url)
  end
  
  def test_zeige_url
    assert_equal("http://de.wikipedia.org/wiki/Theodor_Herzl",
                 autorenlinks(:de).zeige_url)
    assert_equal("Xenophantes' Homepage",
                 autorenlinks(:xenophantes_homepage).zeige_url)
    assert_equal("Eine Beschreibung",
                 autorenlinks(:herzl_mit_beschreibung).zeige_url)

    assert_equal("http://link_ohne_http.invalid",
                 autorenlinks(:link_ohne_http).full_url)
  end 
end
