require "test_helper"

class WorkoutTest < ActiveSupport::TestCase
  test "sets default name if not provided during creation" do
    workout = Workout.create!
    assert_equal "New Empty Workout", workout.name
  end

  test "sets start time of new workout to current time if not provided" do
    freeze_time do
      workout = Workout.create!
      assert_equal Time.current, workout.started_at
    end
  end

  test ".current returns already started workout" do
    assert_nil Workout.current
    Workout.create!(finished_at: Time.current)
    assert_nil Workout.current
    workout = Workout.create!
    assert_equal workout, Workout.current
  end
end
