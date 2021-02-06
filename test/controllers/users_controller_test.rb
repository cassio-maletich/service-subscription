require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { cpf: "00011100066", email: "test@mail.com", name: @user.name } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should create user & order" do
    assert_difference -> { User.count } => 1, -> { Order.count } => 1 do
      post users_url, params: { user: { cpf: "00011100066", email: "test@mail.com", name: @user.name, orders_attributes: [{ value: 100, imei: "798789789798", device: "Redmi Note 8" }] } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should create user & orders" do
    assert_difference -> { User.count } => 1, -> { Order.count } => 2 do
      post users_url, params: { user: { cpf: "00011100066", email: "test@mail.com", name: @user.name, 
        orders_attributes: [
          { value: 100, imei: "798789789798", device: "Redmi Note 8" },
          { value: 300, imei: "123123123354", device: "Samsung Galaxy 11" }
        ] 
      } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "shouldnt create invalid user" do
    assert_no_difference('User.count') do
      post users_url, params: { user: { email: "test@mail.com", name: @user.name } }
    end

    assert_response :unprocessable_entity
  end

  test "shouldnt create user - invalid nested order" do
    assert_no_difference('User.count') do
      post users_url, params: { user: { cpf: "00011100066", email: "test@mail.com", name: @user.name, orders_attributes: [{ imei: "798789789798", device: "Redmi Note 8" }] } }
    end

    assert_response :unprocessable_entity
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { cpf: "00001111", email: "user@mail.com", name: @user.name } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
