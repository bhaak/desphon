class HomepageController < ApplicationController

	def rss
    minTime = Time.rfc2822(request.env["HTTP_IF_MODIFIED_SINCE"]) rescue nil
    @texte = Onlinetextelink.find :all, :order => "onlinetextelinks.created_at desc",:limit => 15, :include => [:onlinetext, {:onlinetext => :autoren}]
    if minTime and @texte[0].created_at <= minTime then
      render :nothing => true, :status => 304 if in_production?
    else
      headers["Content-Type"] = "application/xml"
      response.headers['Last-Modified'] = @texte[0].created_at.httpdate
      render :layout => false 
    end
  end


	def neuigkeiten
    @news = Comatose::Page.find_by_slug('news')
	end
	alias :index :neuigkeiten

end
