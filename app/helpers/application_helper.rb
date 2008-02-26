# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # http://www.telefonica.net/web2/bizarro/blog/2006/04/how-to-use-multi-select-list-boxes.html
  def multi_select_collection(collection_name, list_selections,
                              current_selections, value_method,
                              text_method, size=5)
    result = "<select name='#{collection_name}[]' id='#{collection_name}'"
    result << " multiple='multiple' size='#{size}'>\n"
    if list_selections != nil
      list_selections.each do |l|
        result << "<option "
        result << "selected='selected' " if current_selections.include?(l)
        result << "value='#{l.send(value_method)}'>"
        result << "#{l.send(text_method)}"
        result << "</option>\n"
      end
    end
    result << "</select>\n"
    return result
  end


  # liefert ein Inhaltsverzeichnis zurueck, bei dem nur die in "alphabet" vorhanden Zeichen verlinkt sind
  def toc(alphabet)
    result = "<div class='toc'>"
    for buchstabe in 'A'..'Z'
      if alphabet.include?(buchstabe) then
        result << "<a href='##{buchstabe}'>#{buchstabe}</a> "
      else
        result << "<span>#{buchstabe}</span> "
      end
    end
    result << '</div>'
    return result
  end

  def letzte_aktualisierung
    Time.parse(ActiveRecord::Base.connection.select_value("select max(created) neueste from (
      select max(created_on) created from comatose_pages union
      select max(created_at) created from onlinetextelinks union
      select max(created_at) created from autoren union
      select max(created_at) created from onlinetexte
    )"))
  end
end
