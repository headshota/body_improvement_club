class ExercisesController < ApplicationController
  def index
    # TODO: pagination needs to be implemented
    @exercises = Exercise.all
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
