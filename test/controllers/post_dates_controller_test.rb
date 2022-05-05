require "test_helper"

class PostDatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_date = post_dates(:one)
  end

  test "should get index" do
    get post_dates_url
    assert_response :success
  end

  test "should get new" do
    get new_post_date_url
    assert_response :success
  end

  test "should create post_date" do
    assert_difference("PostDate.count") do
      post post_dates_url, params: { post_date: { petrol_station_id: @post_date.petrol_station_id, title: @post_date.title, user_id: @post_date.user_id } }
    end

    assert_redirected_to post_date_url(PostDate.last)
  end

  test "should show post_date" do
    get post_date_url(@post_date)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_date_url(@post_date)
    assert_response :success
  end

  test "should update post_date" do
    patch post_date_url(@post_date), params: { post_date: { petrol_station_id: @post_date.petrol_station_id, title: @post_date.title, user_id: @post_date.user_id } }
    assert_redirected_to post_date_url(@post_date)
  end

  test "should destroy post_date" do
    assert_difference("PostDate.count", -1) do
      delete post_date_url(@post_date)
    end

    assert_redirected_to post_dates_url
  end
end
