require 'test_helper'

class FowardsControllerTest < ActionController::TestCase
  setup do
    @foward = fowards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fowards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create foward" do
    assert_difference('Foward.count') do
      post :create, foward: { chat_id: @foward.chat_id, first_name: @foward.first_name, last_name: @foward.last_name }
    end

    assert_redirected_to foward_path(assigns(:foward))
  end

  test "should show foward" do
    get :show, id: @foward
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @foward
    assert_response :success
  end

  test "should update foward" do
    patch :update, id: @foward, foward: { chat_id: @foward.chat_id, first_name: @foward.first_name, last_name: @foward.last_name }
    assert_redirected_to foward_path(assigns(:foward))
  end

  test "should destroy foward" do
    assert_difference('Foward.count', -1) do
      delete :destroy, id: @foward
    end

    assert_redirected_to fowards_path
  end
end
