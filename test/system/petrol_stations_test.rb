require "application_system_test_case"

class PetrolStationsTest < ApplicationSystemTestCase
  setup do
    @petrol_station = petrol_stations(:one)
  end

  test "visiting the index" do
    visit petrol_stations_url
    assert_selector "h1", text: "Petrol stations"
  end

  test "should create petrol station" do
    visit petrol_stations_url
    click_on "New petrol station"

    fill_in "Address", with: @petrol_station.address
    fill_in "Name", with: @petrol_station.name
    click_on "Create Petrol station"

    assert_text "Petrol station was successfully created"
    click_on "Back"
  end

  test "should update Petrol station" do
    visit petrol_station_url(@petrol_station)
    click_on "Edit this petrol station", match: :first

    fill_in "Address", with: @petrol_station.address
    fill_in "Name", with: @petrol_station.name
    click_on "Update Petrol station"

    assert_text "Petrol station was successfully updated"
    click_on "Back"
  end

  test "should destroy Petrol station" do
    visit petrol_station_url(@petrol_station)
    click_on "Destroy this petrol station", match: :first

    assert_text "Petrol station was successfully destroyed"
  end
end
