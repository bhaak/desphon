class Autorenlink < ActiveRecord::Base
	belongs_to :autor
	
  # liefert einen vollstaengien HTTP-Url abhaengig vom Typ des Links zurueck
	def full_url
		case typ
    when /wikipedia_(..)/
			return "http://"+$~[1]+".wikipedia.org/wiki/"+url
    when "gutenberg.org"
			return "http://www.gutenberg.org/author/"+url
    when "gutenberg.spiegel.de"
			return "http://gutenberg.spiegel.de/autoren/"+url
    when "fictionfantasy.de"
      return "http://www.fictionfantasy.de/load.php?name=News&file=article&sid="+url
    when "homepage", "sonstiges"
      return url
    else
			return url
		end
		# TODO
    # dsfdb.org, isfdb.org
	  # perrypedia, perry-rhodan.net link
		# http://www.nemesisarchiv.de.vu/
	end

  def options
    [
      ["Homepage", "homepage"],
      ["Wikipedia DE", "wikipedia_de"],
      ["Wikipedia EN", "wikipedia_en"],
      ["Wikipedia FR", "wikipedia_fr"],
      ["Wikipedia IT", "wikipedia_it"],
      ["Gutenberg", "gutenberg.org"],
      ["Gutenberg DE", "gutenberg.spiegel.de"],
      ["FictionFantasy DE", "fictionfantasy.de"],
      ["Sonstiger Link", "sonstiges"],
    ]
  end

end
