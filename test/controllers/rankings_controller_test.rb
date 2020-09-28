require 'test_helper'

class RankingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rankings_index_url
    assert_response :success
  end

  test "should get show" do
    get rankings_show_url
    assert_response :success
  end

  test "should get new" do
    get rankings_new_url
    assert_response :success
  end

  test "should get create" do
    get rankings_create_url
    assert_response :success
  end

  test "should get edit" do
    get rankings_edit_url
    assert_response :success
  end

  test "should get update" do
    get rankings_update_url
    assert_response :success
  end

  test "should get destroy" do
    get rankings_destroy_url
    assert_response :success
  end

end
