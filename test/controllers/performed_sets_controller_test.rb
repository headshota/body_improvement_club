require "test_helper"

class PerformedSetsControllerTest < ActionDispatch::IntegrationTest
  test "create new performed set" do
    sign_in_as(User.take)
    workout = Workout.create!
    exercise = exercises(:barbell_squat)
    performed_exercise = workout.performed_exercises.create!(exercise: exercise)
    assert_difference -> { PerformedSet.count }, 1 do
      post performed_exercise_performed_sets_path(performed_exercise)
    end
    assert_redirected_to workout_path(workout)
  end

  test "destroy" do
    sign_in_as(User.take)
    performed_set = performed_sets(:performed_squat_set_one)
    workout = performed_set.performed_exercise.workout

    assert_difference -> { PerformedSet.count }, -1 do
      delete performed_set_path(performed_set)
    end

    assert_redirected_to edit_workout_path(workout)
  end

  test "update" do
    sign_in_as(User.take)
    workout = Workout.create!
    exercise = exercises(:barbell_squat)
    performed_exercise = workout.performed_exercises.create!(exercise: exercise)
    performed_set = performed_exercise.performed_sets.create!

    freeze_time do
      patch performed_set_path(performed_set),
      params: { performed_set: { done: "1", performed_reps: 5, rpe: 8 } }

      assert_redirected_to edit_workout_path(workout)

      performed_set.reload
      assert_equal 5, performed_set.performed_reps
      assert_equal 8, performed_set.rpe
      assert_equal Time.zone.now, performed_set.done_at
    end
  end
end
