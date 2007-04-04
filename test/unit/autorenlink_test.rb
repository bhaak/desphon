require File.dirname(__FILE__) + '/../test_helper'

class AutorenlinkTest < Test::Unit::TestCase
  fixtures :autorenlinks

  def test_links
    assert_equal("Theodor_Herzl",
                 autorenlinks(:unbekannt).full_url)
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
  end
end
