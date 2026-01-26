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
    @workout = Workout.find(params[:id])
  end

  def destroy
    workout = Workout.find(params[:id])
    workout.destroy!
    redirect_to workouts_path
  end
end
