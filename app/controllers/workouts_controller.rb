class WorkoutsController < ApplicationController
  def index
    @current_workout = Workout.current
  end

  def create
    @workout = Workout.start_new!

    redirect_to edit_workout_path(@workout)
  end

  def show
  end

  def edit
    @workout = Workout
      .includes(performed_exercises: [ :exercise, :performed_sets ])
      .find(params[:id])
    @name_form_visible = show_name_form?
  end

  def update
    @workout = Workout.find(params[:id])

    if finish_workout?
      @workout.finish!
      redirect_to workouts_path and return
    else
      @workout.update!(workout_params)
    end

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

  def show_name_form?
    params[:name_form_visible].to_s == "true"
  end

  def finish_workout?
    params[:finish_workout].present?
  end
end
