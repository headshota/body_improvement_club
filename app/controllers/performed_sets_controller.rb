class PerformedSetsController < ApplicationController
  def create
    performed_exercise = PerformedExercise.includes(:workout).find(params[:performed_exercise_id])
    performed_exercise.performed_sets.create!

    redirect_to workout_path(performed_exercise.workout)
  end

  def edit
    @performed_set = PerformedSet.includes(performed_exercise: :workout).find(params[:id])
  end

  def destroy
    performed_set = PerformedSet.includes(performed_exercise: :workout).find(params[:id])
    workout = performed_set.performed_exercise.workout


    performed_set.destroy!

    redirect_to workout_path(workout)
  end
end
