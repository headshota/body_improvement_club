class ExercisesController < ApplicationController
  include Pagy::Method
  def index
    @pagy, @exercises = pagy(:offset, Exercise.order(:id).all, limit: 5)
  end

  def new
    @exercise = Exercise.new
  end

  def create
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])
    @exercise.update!(exercise_params)

    redirect_to exercises_path, notice: "Exercise updated!"
  end

  def delete
  end

  private

  def exercise_params
    params.expect(exercise: [ :name, :description ])
  end
end
