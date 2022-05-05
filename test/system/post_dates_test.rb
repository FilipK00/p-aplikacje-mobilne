require "application_system_test_case"

class PostDatesTest < ApplicationSystemTestCase
  setup do
    @post_date = post_dates(:one)
  end

  test "visiting the index" do
    visit post_dates_url
    assert_selector "h1", text: "Post dates"
  end

  test "should create post date" do
    visit post_dates_url
    click_on "New post date"

    fill_in "Petrol station", with: @post_date.petrol_station_id
    fill_in "Title", with: @post_date.title
    fill_in "User", with: @post_date.user_id
    click_on "Create Post date"

    assert_text "Post date was successfully created"
    click_on "Back"
  end

  test "should update Post date" do
    visit post_date_url(@post_date)
    click_on "Edit this post date", match: :first

    fill_in "Petrol station", with: @post_date.petrol_station_id
    fill_in "Title", with: @post_date.title
    fill_in "User", with: @post_date.user_id
    click_on "Update Post date"

    assert_text "Post date was successfully updated"
    click_on "Back"
  end

  test "should destroy Post date" do
    visit post_date_url(@post_date)
    click_on "Destroy this post date", match: :first

    assert_text "Post date was successfully destroyed"
  end
end
