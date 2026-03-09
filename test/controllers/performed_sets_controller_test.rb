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
    performed_set = performed_exercise.performed_sets.create!

    assert_difference -> { PerformedSet.count }, -1 do
      delete workout_performed_exercise_performed_set_path(workout, performed_exercise, performed_set)
    end

    assert_redirected_to workout_path(workout)
  end


  test "edit" do
    workout = Workout.create!
    exercise = exercises(:barbell_squat)
    performed_exercise = workout.performed_exercises.create!(exercise: exercise)
    performed_set = performed_exercise.performed_sets.create!

    get edit_workout_performed_exercise_performed_set_path(workout, performed_exercise, performed_set)
    assert_response :success
  end

  test "update" do
    workout = Workout.create!
    exercise = exercises(:barbell_squat)
    performed_exercise = workout.performed_exercises.create!(exercise: exercise)
    performed_set = performed_exercise.performed_sets.create!

    freeze_time do
      patch workout_performed_exercise_performed_set_path(workout, performed_exercise, performed_set),
      params: { performed_set: { done_at: Time.zone.now, performed_reps: 5, rpe: 8 } }

      assert_redirected_to workout_path(workout)

      performed_set.reload
      assert_equal 5, performed_set.performed_reps
      assert_equal 8, performed_set.rpe
      assert_equal Time.zone.now, performed_set.done_at
    end
  end
end
