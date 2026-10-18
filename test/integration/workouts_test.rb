require "test_helper"

class WorkoutsTest < ActionDispatch::IntegrationTest
  test "displays header for index page" do
    sign_in_as(User.take)
    get workouts_path
    assert_dom "h1", "Workout"
  end

  test "displays link for creating new workout" do
    sign_in_as(User.take)
    workouts(:ongoing).destroy!
    get workouts_path
    assert_dom "a", "Start New Workout"
    refute_dom "a", "Continue Ongoing Workout"
  end

  test "when there is ongoing displays link to continue" do
    sign_in_as(User.take)
    Workout.create!
    get workouts_path
    assert_dom "a", "Continue Ongoing Workout"
  end

  test "displays a button for cancelling the workout" do
    sign_in_as(User.take)
    workout = Workout.create!
    get edit_workout_path(workout)
    assert_dom "button", "Cancel Workout"
  end

  test "displays performed exercise overview for finished workouts" do
    sign_in_as(User.take)
    finished_workout = workouts(:finished)
    exercise = exercises(:barbell_squat)
    performed_exercise = finished_workout.performed_exercises.create!(exercise: exercise, position: 1)
    performed_exercise.performed_sets.create!(weight: 100, performed_reps: 8)

    get workouts_path
    assert_response :success
    assert_select "div", text: /Finished Workout/
    assert_select "div", text: /Barbell Squat/
    assert_select "li", text: /100 kg × 8 reps/
  end
end
