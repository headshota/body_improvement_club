require "test_helper"

class WorkoutsTest < ActionDispatch::IntegrationTest
  test "displays header for index page" do
    get "/workouts"
    assert_dom "h1", "Workout"
  end
  test "displays link for creating new workout" do
    get "/workouts"
    assert_dom "a", "Start New Workout"
    refute_dom "a", "Continue Ongoing Workout"
  end
  test "When there is ongoing workout displays link to continue" do
    Workout.create!
    get "/workouts"
    assert_dom "a", "Continue Ongoing Workout"
  end

  test "Workout page displays a button for cancelling the workout" do
    workout = Workout.create!
    get "/workouts/#{workout.id}"
    assert_dom "a", "Cancel Workout"
  end
end
