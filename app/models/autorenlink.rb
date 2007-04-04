class Autorenlink < ActiveRecord::Base
	
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
    # dsfdb.org, isfdb.org
	end

end
