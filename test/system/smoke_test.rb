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

    assert_selector "header", text: "Barbell Squat"

    # Add Set to the new exercise
    click_on "Add Set"

    # Enter set values
    find_field("performed_set[weight]").fill_in with: "120"
    find_field("performed_set[performed_reps]").fill_in with: "5"
    find_field("performed_set[done]").check

    # Check if values persist after page reload
    refresh

    assert_equal "120", find_field("performed_set[weight]").value
    assert_equal "5", find_field("performed_set[performed_reps]").value
    find_field("performed_set[done]").has_checked_field?

    confirm_message = accept_confirm do
      click_on "Finish Workout"
    end

    assert_equal "Are you sure?", confirm_message
  end
end
