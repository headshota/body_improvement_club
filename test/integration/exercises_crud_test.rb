require "test_helper"

class ExercisesCRUDTest < ActionDispatch::IntegrationTest
  test "displays header for index page" do
    sign_in_as(User.take)
    get exercises_path
    assert_dom "h1", "Exercises"
  end
end
