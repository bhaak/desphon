# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  before_filter :autorisiert?

  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_desphon_session_id'

  # session :disabled => true

  def autorisiert?
    @autorisiert = request.remote_ip == '192.168.0.245'
    @autorisiert ||= true if not in_production?
    true
  end

  def redirect_to_homepage
    if not @autorisiert then
      redirect_to :controller => "homepage"
    end
    #redirect_to :action => 'show', :controller => "onlinetexte", :id => @onlinetextelink.onlinetext_id
  end
  
  def in_production?
    return ENV['RAILS_ENV'] == 'production'
  end
  
end
