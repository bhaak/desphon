require File.dirname(__FILE__) + '/../test_helper'
require 'autoren_controller'

# Re-raise errors caught by the controller.
class AutorenController; def rescue_action(e) raise e end; end

class AutorenControllerAutorisiertTest < Test::Unit::TestCase
  fixtures :autoren

  def setup
    @controller = AutorenController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = autoren(:autor_vollstaendig_mit_datum).id

    @request.remote_addr = "127.0.0.2" # autorisiert
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:autor)
  end

  def test_create
    num_autoren = Autor.count

    post :create, :autor => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_autoren + 1, Autor.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:autor)
    assert assigns(:autor).valid?
  end

  def est_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Autor.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Autor.find(@first_id)
    }
  end
end
