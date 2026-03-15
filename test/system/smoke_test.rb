require "application_system_test_case"

class SmokeTest < ApplicationSystemTestCase
  test "create new workout" do
    visit workouts_path
    click_on "Start New Workout"

    assert_selector "h1", text: "New Empty Workout"
  end

  test "Change workout name" do
    visit workouts_path
    click_on "Start New Workout"

    click_on "New Empty Workout"
    fill_in "workout[name]", with: "My Morning Workout"
    find("body").click

    assert_selector "h1", text: "My Morning Workout"
  end
end
