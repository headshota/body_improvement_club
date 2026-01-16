class Workout < ApplicationRecord
  has_many :performed_exercises, dependent: :destroy
  validates :name, presence: true
  validates :started_at, presence: true

  before_validation :set_default_name
  before_validation :set_start_time

  def self.current
    Workout.where.not(started_at: nil)
    .where(finished_at: nil).first
  end

  private

  def set_default_name
    if !persisted? && name.blank?
      self.name = "New Empty Workout"
    end
  end

  def set_start_time
    if !persisted? && started_at.blank?
      self.started_at = Time.zone.now
    end
  end
end
