class WorkoutsController < ApplicationController
  def index
    @current_workout = Workout.current
  end

  def create
    @current_workout = Workout.current

    if !@current_workout.blank?
      @current_workout.destroy
    end

    @workout = Workout.create!

    redirect_to @workout
  end

  def show
    @workout = Workout
      .includes(performed_exercises: [ :exercise, :performed_sets ])
      .find(params[:id])
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])
    @workout.update!(workout_params)

    redirect_to @workout
  end

  def destroy
    workout = Workout.includes(performed_exercises: :performed_sets).find(params[:id])
    workout.destroy!
    redirect_to workouts_path
  end

  private

  def workout_params
    params.expect(workout: [ :name ])
  end
end
