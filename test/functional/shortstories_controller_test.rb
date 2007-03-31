require File.dirname(__FILE__) + '/../test_helper'
require 'shortstories_controller'

# Re-raise errors caught by the controller.
class ShortstoriesController; def rescue_action(e) raise e end; end

class ShortstoriesControllerTest < Test::Unit::TestCase
  fixtures :shortstories

  def setup
    @controller = ShortstoriesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = shortstories(:first).id
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

    assert_not_nil assigns(:shortstories)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:shortstory)
    assert assigns(:shortstory).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:shortstory)
  end

  def test_create
    num_shortstories = Shortstory.count

    post :create, :shortstory => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_shortstories + 1, Shortstory.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:shortstory)
    assert assigns(:shortstory).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Shortstory.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Shortstory.find(@first_id)
    }
  end
end
