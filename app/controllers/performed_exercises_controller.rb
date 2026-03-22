class PerformedExercisesController < ApplicationController
  def show
  end

  def new
    @workout = Workout.find(params[:workout_id])
    @performed_exercise = PerformedExercise.new
  end

  def create
    workout = Workout.find(params[:workout_id])
    exercise = Exercise.find(params[:performed_exercise][:exercise])
    PerformedExercise.create!(
      workout: workout,
      exercise: exercise
    )
    redirect_to edit_workout_path(workout)
  end

  def edit
  end

  def update
  end

  def destroy
    @performed_exercise = PerformedExercise
    .includes(:performed_sets, :workout).find(params[:id])

    @performed_exercise.destroy!

    respond_to do |format|
      format.html { redirect_to edit_workout_path(@performed_exercise.workout) }
      format.turbo_stream
    end
  end
end
