require 'test_helper'

class MessageOptionsControllerTest < ActionController::TestCase
  setup do
    @message_option = message_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:message_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create message_option" do
    assert_difference('MessageOption.count') do
      post :create, message_option: { message_id: @message_option.message_id, options_id: @message_option.options_id }
    end

    assert_redirected_to message_option_path(assigns(:message_option))
  end

  test "should show message_option" do
    get :show, id: @message_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @message_option
    assert_response :success
  end

  test "should update message_option" do
    patch :update, id: @message_option, message_option: { message_id: @message_option.message_id, options_id: @message_option.options_id }
    assert_redirected_to message_option_path(assigns(:message_option))
  end

  test "should destroy message_option" do
    assert_difference('MessageOption.count', -1) do
      delete :destroy, id: @message_option
    end

    assert_redirected_to message_options_path
  end
end
