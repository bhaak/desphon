require File.dirname(__FILE__) + '/../test_helper'
require 'autorenlinks_controller'

# Re-raise errors caught by the controller.
class AutorenlinksController; def rescue_action(e) raise e end; end

class AutorenlinksControllerTest < Test::Unit::TestCase
	fixtures :autorenlinks

	def setup
		@controller = AutorenlinksController.new
		@request    = ActionController::TestRequest.new
		@response   = ActionController::TestResponse.new
	end

	# noch keine Tests
	def test_true
		true
	end

end
