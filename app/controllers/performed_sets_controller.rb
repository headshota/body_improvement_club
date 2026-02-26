class PerformedSetsController < ApplicationController
  def create
    workout = Workout.find(params[:workout_id])
    performed_exercise = PerformedExercise.find(params[:performed_exercise_id])
    performed_exercise.performed_sets.create!

    redirect_to workout_path(workout)
  end
end
