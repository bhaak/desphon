require "#{File.dirname(__FILE__)}/../test_helper"

class HomepageTest < ActionController::IntegrationTest
  fixtures :autoren, :onlinetexte, :autoren_onlinetexte, :onlinetextelinks

  def test_homepage
	  get '/desphon/'
		assert_response :success
    assert_template 'index'
	end

  def test_rss
	  get rss_url
		assert_response :success
    assert_template 'rss'
	end

end
