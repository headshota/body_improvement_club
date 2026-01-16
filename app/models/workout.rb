class Workout < ApplicationRecord
  has_many :performed_exercises, dependent: :destroy
  validates :name, presence: true

  before_validation :set_default_name
  before_validation :set_start_time

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
