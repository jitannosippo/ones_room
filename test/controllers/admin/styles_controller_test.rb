require "test_helper"

class Admin::StylesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_styles_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_styles_edit_url
    assert_response :success
  end
end
