class Autor < ActiveRecord::Base
	has_and_belongs_to_many  :onlinetexte
	has_many  :autorenlinks

  def to_param
    return "#{id}-#{kurzname.normalisiert.gsub(/[^a-z0-9]+/i, '-')}"
  end

  MONATSNAMEN = [nil, "Januar", "Februar", "März", "April", "Mai", "Juni",
    "Juli", "August", "September", "Oktober", "November", "Dezember"]

  def kurzname
    str = vorname.blank? ? "" : vorname

    if not nachname.blank? then
      str += (str.blank? ? "" : " ")+nachname
    end

    return str
  end

  def genitiv
    str = kurzname

    if str == "" then return "" end

    if ['s','x'].include?(kurzname[-1..-1]) then
      return str+"'"
    else
      return str+"s"
    end
  end

  def nachname_vorname
    str = vorname.blank? ? "" : vorname

    if not nachname.blank? then
      str = nachname + (str.blank? ? "" : ", " + str)
    end

    return str
  end

  def zeigeNamen
    str = nachname_vorname
    
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

  def zeigeTodesdatum
    return zeigeDatum(todesjahr, todesmonat, todestag, todesjahr_gesichert)
  end

  def zeigeGeburtsdatum
    return zeigeDatum(geburtsjahr, geburtsmonat, geburtstag, geburtsjahr_gesichert)
  end

  def zeigeDatum(jahr, monat=nil, tag=nil, gesichert=true)
    if jahr == nil then return "" end
    datum = jahr.to_s
    datum += "?" if !gesichert
    if monat != nil then
      datum = MONATSNAMEN[monat]+" "+datum
    end
    if tag != nil then
      datum = tag.to_s+". "+datum
    end
    return datum
  end
end
