require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test "valid order" do
    order = Order.new(value: 100, imei: "798789789798", device: "Redmi Note 8", installments: 1, user: @user)
    assert order.valid?
  end

  test "invalid order - missing value" do
    order = Order.new(imei: "798789789798", device: "Redmi Note 8", user: @user)
    assert_not order.valid?
    assert_not_empty order.errors["value"]
    assert_not_empty order.errors["installments"]
  end

  test "invalid order - missing imei" do
    order = Order.new(value: 100, device: "Redmi Note 8", user: @user)
    assert_not order.valid?
    assert_not_empty order.errors["imei"]
  end

  test "invalid order - missing device" do
    order = Order.new(value: 100, imei: "798789789798", user: @user)
    assert_not order.valid?
    assert_not_empty order.errors["device"]
  end

  test "invalid order - missing user" do
    order = Order.new(value: 100, imei: "798789789798", device: "Redmi Note 8")
    assert_not order.valid?
    assert_not_empty order.errors["user"]
  end
end
