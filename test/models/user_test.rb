require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.create(name:"Lasery", email:"LASERY@gmail.com", password:"foobar", password_confirmation:"foobar")
  end

  test "validity" do
    assert @user.valid?
  end

  test "name" do
    @user.name = "   "
    assert_not @user.save
    @user.name = "a" * 51
    assert_not @user.save
    @another = User.new(name:"Lasery", email:"another@gmail.com", password:"foobar", password_confirmation:"foobar")
    assert_not @another.save
  end

  test "email" do
    @user.email = "a" *256
    assert_not @user.save
    @another = User.new(name:"Eartho", email:"lasery@gmail.com", password:"foobar", password_confirmation:"foobar")
    assert_not @another.save
  end
  
  test "password" do
    @another = User.new(name:"Tester", email:"Tester@gmail.com")
    assert_not @another.save
    byebug
    @another.password = @another.password_confirmation = " " * 6
    assert_not @another.valid?
    @another.password = "foobar"
    @another.password_confirmation = "banana"
    assert_not @another.valid?
  end

end
