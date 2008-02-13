require File.dirname(__FILE__) + '/../test_helper'
require 'autoren_controller'

# Re-raise errors caught by the controller.
class AutorenController; def rescue_action(e) raise e end; end

class AutorenControllerTest < Test::Unit::TestCase
  fixtures :autoren

  def setup
    @controller = AutorenController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = autoren(:autor_vollstaendig_mit_datum).id
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

    assert_not_nil assigns(:autoren)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:autor)
    assert assigns(:autor).valid?
  end

end
