require "#{File.dirname(__FILE__)}/../test_helper"

require "rexml/document" 

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
		REXML::Document.new(response.body)
	end

  def test_rss_not_modified
	  get rss_url, nil, "If-Modified-Since"=>Time.now.httpdate
		assert_response :not_modified
    assert_template nil
		REXML::Document.new(response.body)
	end

end
