require 'test_helper'

class StaticPageControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
    assert_template 'static_page/home'
    assert_select 'title', 'Home ~ NooApp'
  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_template 'static_page/help'
    assert_select 'title', 'Help ~ NooApp'
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_template 'static_page/about'
    assert_select 'title', 'About ~ NooApp'
  end

  test "should get mission" do
    get mission_url
    assert_response :success
    assert_template 'static_page/mission'
    assert_select 'title', 'Mission ~ NooApp'
  end

  test "should get contact" do
    get contact_url
    assert_response :success
    assert_template 'static_page/contact'
    assert_select 'title', 'Contact ~ NooApp'
  end

end
