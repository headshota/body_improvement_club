class WorkoutsController < ApplicationController
  def index
  end

  def new
    @current_workout = Workout.current

    if !@current_workout.blank?
      @current_workout.destroy
    end

    @workout = Workout.create!

    redirect_to @workout
  end

  def show
  end
end
