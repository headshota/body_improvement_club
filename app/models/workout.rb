class Workout < ApplicationRecord
  has_many :performed_exercises, dependent: :destroy
end
