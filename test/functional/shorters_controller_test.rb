require 'test_helper'

class ShortersControllerTest < ActionController::TestCase
  setup do
    @shorter = shorters(:one)
    @shorter_new = Shorter.new(:url => 'http://www.youtube.com/watch?v=oWYp1xRPH5g', :identifier => "oWYp1xRPH5g", :description => "new song")
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shorters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shorter" do
    if !@shorter_new.valid?
      assert_equal @shorter_new.errors.to_json, @shorter_new.body
    else
      assert_difference('Shorter.count') do
        post :create, shorter: { description: @shorter_new.description, identifier: @shorter_new.identifier, url: @shorter_new.url}, :format => "json"
      end
      assert_equal JSON(response.body)["message"], "Created successfully"
    end

  end

  test "should show shorter" do
    get :show, id: @shorter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shorter
    assert_response :success
  end

  test "should update shorter" do
    put :update, id: @shorter, shorter: { description: @shorter.description, identifier: @shorter.identifier, url: @shorter.url }
    assert_response :success
  end

  test "should destroy shorter" do
    assert_difference('Shorter.count', -1) do
      delete :destroy, id: @shorter
    end

    assert_redirected_to shorters_path
  end
end
