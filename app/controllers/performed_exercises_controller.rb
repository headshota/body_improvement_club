class PerformedExercisesController < ApplicationController
  include Pagy::Method
  def index
    @pagy, @performed_exercises = pagy(:offset, PerformedExercise.order(:id).all, limit: 5)
  end

  def new
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
