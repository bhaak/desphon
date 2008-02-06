ActionController::Routing::Routes.draw do |map|
	# The priority is based upon order of creation: first created -> highest priority.
  
	# Sample of regular route:
	# map.connect 'products/:id', :controller => 'catalog', :action => 'view'
	# Keep in mind you can assign values other than :controller and :action

	# Sample of named route:
	# map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
	# This route can be invoked with purchase_url(:id => product.id)

	# You can have the root of your site routed by hooking up '' 
	# -- just remember to delete public/index.html.
	map.connect '/desphon', :controller => "homepage"

	map.connect '/desphon/neuigkeiten', :controller => "homepage", :action => 'neuigkeiten'
	map.connect '/desphon/faq', :controller => "homepage", :action => 'faq'
	map.connect '/desphon/ueber', :controller => "homepage", :action => 'ueber'

	map.connect '/desphon/onlinetext/:id', :controller => "onlinetexte", :action => 'show'
	map.connect '/desphon/onlinetexte', :controller => "onlinetexte", :action => 'list'

	map.connect '/desphon/autoren', :controller => "autoren", :action => 'list'
	map.connect '/desphon/autor/:id', :controller => "autoren", :action => 'show'

	# Allow downloading Web Service WSDL as a file with an extension
	# instead of a file named 'wsdl'
	#map.connect '/desphon/:controller/service.wsdl', :action => 'wsdl'

	# RSS
	map.rss '/desphon/desphon_rss.xml', :controller => 'homepage', :action => 'rss'

	# Comatose
	map.comatose_admin '/desphon/comatose_admin'

	# Install the default route as the lowest priority.
	map.connect '/desphon/:controller/:action/:id.:format'
	map.connect '/desphon/:controller/:action/:id'
end
