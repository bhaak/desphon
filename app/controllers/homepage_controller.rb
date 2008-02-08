class HomepageController < ApplicationController

	def rss
		minTime = Time.rfc2822(request.env["HTTP_IF_MODIFIED_SINCE"]) rescue nil

		neueste = Time.parse(Onlinetextelink.connection.select_one("select max(created) neueste from (select max(created_on) created from comatose_pages union select max(created_at) created from onlinetextelinks)")["neueste"])

		response.headers['Last-Modified'] = neueste.httpdate if in_production?

		if minTime and neueste <= minTime then
			render :nothing => true, :status => 304
		else
			@texte = Onlinetextelink.find :all, :order => "onlinetextelinks.created_at desc",:limit => 15, :include => [:onlinetext, {:onlinetext => :autoren}]
			@news = Comatose::Page.find_by_slug('news').children.reverse.slice(0..4) # die fünf letzten Nachrichten
			headers["Content-Type"] = "application/xml"
			render :layout => false 
		end
	end


	def neuigkeiten
		@news = Comatose::Page.find_by_slug('news')
	end
	alias :index :neuigkeiten

	def faq
		@title = "FAQ - vermeintlich häufig Gefragtes"
	end
	def ueber
	end
end
