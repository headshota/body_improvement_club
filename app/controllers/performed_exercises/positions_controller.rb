class PerformedExercises::PositionsController < ApplicationController
  def update
    performed_exercise = PerformedExercise.includes(:workout).find(params[:id])
    performed_exercise.update position: params[:position]
  end
end
