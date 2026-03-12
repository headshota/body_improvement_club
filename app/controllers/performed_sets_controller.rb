class PerformedSetsController < ApplicationController
  def create
    @performed_exercise = PerformedExercise.includes(:workout).find(params[:performed_exercise_id])
    @performed_set = @performed_exercise.performed_sets.create!
    @workout = @performed_exercise.workout

    respond_to do |format|
      format.html { redirect_to workout_path(@workout) }
      format.turbo_stream
    end
  end

  def edit
    @performed_set = PerformedSet.includes(performed_exercise: :workout).find(params[:id])
    @performed_exercise = @performed_set.performed_exercise
    @workout = @performed_exercise.workout
  end

  def update
    performed_set = PerformedSet.includes(performed_exercise: :workout).find(params[:id])
    workout = performed_set.performed_exercise.workout

    performed_set.update!(performed_set_params)
    redirect_to workout
  end

  def destroy
    @performed_set = PerformedSet.includes(performed_exercise: :workout).find(params[:id])
    workout = @performed_set.performed_exercise.workout


    @performed_set.destroy!

    respond_to do |format|
      format.html { redirect_to workout_path(workout) }
      format.turbo_stream
    end
  end

  private

  def performed_set_params
    params.expect(performed_set: [ :performed_reps, :weight, :rpe, :done ])
  end
end
