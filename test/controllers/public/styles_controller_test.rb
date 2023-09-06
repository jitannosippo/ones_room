require "test_helper"

class Public::StylesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_styles_index_url
    assert_response :success
  end
end
