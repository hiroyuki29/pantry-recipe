require 'test_helper'

class V1::UserItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get v1_user_items_create_url
    assert_response :success
  end

  test "should get destroy" do
    get v1_user_items_destroy_url
    assert_response :success
  end

end
