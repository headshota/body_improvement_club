require "application_system_test_case"

class SmokeTest < ApplicationSystemTestCase
  test "Do Workout" do
    visit workouts_path
    click_on "Start New Workout"

    assert_selector "h1", text: "New Empty Workout"

    # Change Workout Name
    click_on "New Empty Workout"
    fill_in "workout[name]", with: "My Morning Workout"
    find("body").click

    assert_selector "h1", text: "My Morning Workout"

    # Add Exercise
    click_on "Add Exercise"
    select "Barbell Squat", from: "performed_exercise_exercise"
    click_on "Add Exercise"

    # TODO: assert something here?

    # Add Set to the new exercise
    click_on "Add Set"
  end
end
