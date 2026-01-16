require "test_helper"

class WorkoutTest < ActiveSupport::TestCase
  test "sets default name if not provided during creation" do
    workout = Workout.create!
    assert_equal(workout.name, "New Empty Workout")
  end

  test "sets start time of new workout to current time if not provided" do
    freeze_time do
      workout = Workout.create!
      assert_equal(workout.started_at, Time.current)
    end
  end
end
