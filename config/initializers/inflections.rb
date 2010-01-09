# Add new inflection rules using the following format 
# (all these examples are active by default):
# Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# Add pluralization for german words
ActiveSupport::Inflector.inflections do |i|
	i.irregular 'autor', 'autoren'
	i.irregular 'onlinetext', 'onlinetexte'
	i.irregular 'typ', 'typen'
	i.irregular 'produkt', 'produkte'
	i.irregular 'fehler', 'fehler'
end
