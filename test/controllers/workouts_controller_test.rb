require "test_helper"

class WorkoutsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get workouts_path
    assert_response :success
  end
  test "create" do
    post workouts_path
    created_workout = Workout.last
    assert_redirected_to workout_path(created_workout)
  end
  test "show" do
    workout = Workout.create!
    get workouts_path(workout)
    assert_response :success
  end
  test "destroy" do
    workout = workouts(:finished)
    delete workout_path(workout)
    assert_redirected_to workouts_path
  end
end
