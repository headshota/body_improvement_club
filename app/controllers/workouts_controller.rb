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

    redirect_to edit_workout_path(@workout)
  end

  def show
  end

  def edit
    @workout = Workout
      .includes(performed_exercises: [ :exercise, :performed_sets ])
      .find(params[:id])
    @name_form_visible = (params[:name_form_visible].to_s == "true") || false
  end

  def update
    @workout = Workout.find(params[:id])
    @workout.update!(workout_params)

    redirect_to edit_workout_path(@workout)
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
