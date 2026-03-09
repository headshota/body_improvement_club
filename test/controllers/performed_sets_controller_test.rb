require "test_helper"

class PerformedSetsControllerTest < ActionDispatch::IntegrationTest
  test "create new performed set" do
    workout = Workout.create!
    exercise = exercises(:barbell_squat)
    performed_exercise = workout.performed_exercises.create!(exercise: exercise)
    assert_difference -> { PerformedSet.count }, 1 do
      post workout_performed_exercise_performed_sets_path(workout, performed_exercise)
    end
    assert_redirected_to workout_path(workout)
  end

  test "destroy" do
    workout = Workout.create!
    exercise = exercises(:barbell_squat)
    performed_exercise = workout.performed_exercises.create!(exercise: exercise)
    performed_set = performed_exercise.performed_sets.create

    assert_difference -> { PerformedSet.count }, -1 do
      delete workout_performed_exercise_performed_set_path(workout, performed_exercise, performed_set)
    end

    assert_redirected_to workout_path(workout)
  end
end
