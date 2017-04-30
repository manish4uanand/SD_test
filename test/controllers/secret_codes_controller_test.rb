require 'test_helper'

class SecretCodesControllerTest < ActionController::TestCase
  setup do
    @secret_code = secret_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:secret_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create secret_code" do
    assert_difference('SecretCode.count') do
      post :create, secret_code: { code: @secret_code.code }
    end

    assert_redirected_to secret_code_path(assigns(:secret_code))
  end

  test "should show secret_code" do
    get :show, id: @secret_code
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @secret_code
    assert_response :success
  end

  test "should update secret_code" do
    patch :update, id: @secret_code, secret_code: { code: @secret_code.code }
    assert_redirected_to secret_code_path(assigns(:secret_code))
  end

  test "should destroy secret_code" do
    assert_difference('SecretCode.count', -1) do
      delete :destroy, id: @secret_code
    end

    assert_redirected_to secret_codes_path
  end
end
