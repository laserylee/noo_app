require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    @name1 = "Yonezu Kenshi"
    @name2 = "Bob"
    @email1 = "yonezukenshi@gmail.com"
    @email2 = "wrecked"
    @password1 = "foobar"
    @password2 = "lag"
  end
    

  test "successful signup should render user page" do
    assert_difference 'User.count', 1 do
      post signup_path, params: { user: { name:@name1, email:@email1, password:@password1, password_confirmation:@password1 } }
    end
    assert_template 'users/show'
  end

  test "unsuccessful signup should show error_message" do
    assert_no_difference 'User.count', 0 do
      post signup_path, params: { user: { name:@name2, email:@email2, password:@password2, password_confirmation:@password1 } }
    end
    assert_match "The form contains 4 errors.", response.body
  end

end
