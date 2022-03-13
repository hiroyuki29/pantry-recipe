require 'test_helper'

class V1::MemoItemControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get memo_item_index_url
    assert_response :success
  end

  test "should get create" do
    get memo_item_create_url
    assert_response :success
  end

  test "should get destroy" do
    get memo_item_destroy_url
    assert_response :success
  end

  test "should get update" do
    get memo_item_update_url
    assert_response :success
  end

  test "should get increment" do
    get memo_item_increment_url
    assert_response :success
  end

end
