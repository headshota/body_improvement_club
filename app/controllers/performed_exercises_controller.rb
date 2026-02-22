class PerformedExercisesController < ApplicationController
  include Pagy::Method
  def index
    @pagy, @performed_exercises = pagy(:offset, PerformedExercise.order(:id).all, limit: 5)
  end

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
    redirect_to workout_path(workout)
  end

  def edit
  end

  def update
  end

  def delete
  end
end
