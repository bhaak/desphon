require File.dirname(__FILE__) + '/../test_helper'
require 'onlinetexte_controller'

# Re-raise errors caught by the controller.
class OnlinetexteController; def rescue_action(e) raise e end; end

class OnlinetexteControllerTest < Test::Unit::TestCase
	fixtures :onlinetexte

	def setup
		@controller = OnlinetexteController.new
		@request    = ActionController::TestRequest.new
		@response   = ActionController::TestResponse.new
	end

	def test_index
		get :index
		assert_response :success
		assert_template 'list'
	end

	def test_list
		get :list

		assert_response :success
		assert_template 'list'

		assert_not_nil assigns(:onlinetexte)
	end

	def test_veroeffentlicht
		get :veroeffentlicht

		assert_response :success
		assert_template 'veroeffentlicht'

		assert_not_nil assigns(:onlinetexte)
	end

end
