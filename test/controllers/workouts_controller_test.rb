require "test_helper"

class WorkoutsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get workouts_path
    assert_response :success
  end

  test "create new workout" do
    workouts(:ongoing).destroy!

    assert_difference -> { Workout.count }, 1 do
      post workouts_path
    end

    created_workout = Workout.last
    assert_redirected_to edit_workout_path(created_workout)
  end

  test "show" do
    workout = Workout.create!
    get workout_path(workout)
    assert_response :success
  end

  test "destroy workout" do
    workout = workouts(:finished)
    exercise = exercises(:barbell_squat)
    performed_exercise = workout.performed_exercises.create!(exercise: exercise)
    performed_exercise.performed_sets.create!(performed_exercise: performed_exercise)

    assert_difference -> { Workout.count }, -1 do
      delete workout_path(workout)
    end
    assert_redirected_to workouts_path
  end
end
