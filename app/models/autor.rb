class Autor < ActiveRecord::Base
	has_many  :onlinetexte

  def zeigeNamen
    str = ""

    if vorname != nil then str = vorname end

    if str != "" && nachname != nil then
      str = nachname + ", " + str
    elsif nachname != nil then
      str = nachname
    end
    
    if (geburtsjahr != nil) && (todesjahr != nil) then
      str += " ("+zeigeGeburtsjahr+"-"+zeigeTodesjahr+")"
    elsif (geburtsjahr != nil) then
      str += " ("+zeigeGeburtsjahr+")"
    elsif (todesjahr != nil) then
      str += " (-"+zeigeTodesjahr+")"
    end
      
    return str
  end

  def zeigeGeburtsjahr
    if (geburtsjahr != nil)
      geburtsjahr.to_s+(!geburtsjahr_gesichert ? "?" : "")
    else
      return ""
    end
  end
  
  def zeigeTodesjahr
    if (todesjahr != nil)
      todesjahr.to_s+(!todesjahr_gesichert ? "?" : "")
    else
      return ""
    end
  end

end
