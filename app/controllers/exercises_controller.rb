class ExercisesController < ApplicationController
  include Pagy::Method
  def index
    @pagy, @exercises = pagy(:offset, Exercise.all, limit: 5)
  end

  def new
    @exercise = Exercise.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end
end
