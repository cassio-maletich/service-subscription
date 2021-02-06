require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "valid user" do
    user = User.new(name: "Cássio", email: "cgm1010@gmail.com", cpf: "00000000000")
    assert user.valid?
  end

  test "invalid user - missing name" do
    user = User.new(email: "cgm1010@gmail.com", cpf: "00000000000")
    assert_not user.valid?
    assert_not_empty user.errors["name"]
  end

  test "invalid user - missing cpf" do
    user = User.new(name: "Cássio", email: "cgm1010@gmail.com")
    assert_not user.valid?
    assert_not_empty user.errors["cpf"]
  end

  test "invalid user - missing email" do
    user = User.new(name: "Cássio", cpf: "00000000000")
    assert_not user.valid?
    assert_not_empty user.errors["email"]
  end

  test "invalid user - invalid email" do
    user = User.new(name: "Cássio", email: "cgm1010@gmail", cpf: "00000000000")
    assert_not user.valid?
    assert_not_empty user.errors["email"]
  end
end
