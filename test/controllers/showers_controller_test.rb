require 'test_helper'

class ShowersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get showers_index_url
    assert_response :success
  end

  test "should get show" do
    get showers_show_url
    assert_response :success
  end

  test "should get new" do
    get showers_new_url
    assert_response :success
  end

  test "should get create" do
    get showers_create_url
    assert_response :success
  end

  test "should get edit" do
    get showers_edit_url
    assert_response :success
  end

  test "should get update" do
    get showers_update_url
    assert_response :success
  end

  test "should get delete" do
    get showers_delete_url
    assert_response :success
  end

end
