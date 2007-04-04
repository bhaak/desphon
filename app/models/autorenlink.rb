class Autorenlink < ActiveRecord::Base
	
	def full_url
		if typ == 'wikipedia_de' then
			return "http://de.wikipedia.org/wiki/"+url
		elsif typ == 'wikipedia_en' then
			return "http://en.wikipedia.org/wiki/"+url
		else
			return url
		end
	end

end
