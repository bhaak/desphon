class Onlinetextelink < ActiveRecord::Base
	belongs_to :onlinetext

  def zeige_url
    if url_beschreibung != nil && url_beschreibung != "" then
      return url_beschreibung
    else
      return url
    end
  end
end
