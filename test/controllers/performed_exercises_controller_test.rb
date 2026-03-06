require "test_helper"

class PerformedExercisesControllerTest < ActionDispatch::IntegrationTest
  test "create new performed exercise" do
    workout = Workout.create!
    assert_difference -> { PerformedExercise.count }, 1 do
      exercise = exercises(:barbell_squat)
      post workout_performed_exercises_path(workout, performed_exercise: { exercise: })
    end

    assert_redirected_to workout_path(workout)
  end
end
