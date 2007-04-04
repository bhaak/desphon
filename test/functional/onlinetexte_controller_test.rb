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

    @first_id = onlinetexte(:first).id
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

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:onlinetext)
    assert assigns(:onlinetext).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:onlinetext)
  end

  def test_create
    num_onlinetexte = Onlinetext.count

    post :create, :onlinetext => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_onlinetexte + 1, Onlinetext.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:onlinetext)
    assert assigns(:onlinetext).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Onlinetext.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Onlinetext.find(@first_id)
    }
  end
end
