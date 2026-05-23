class Workout < ApplicationRecord
  attribute :name, :string,  default: "New Empty Workout"
  attribute :started_at, :datetime, default: -> { Time.current }

  has_many :performed_exercises, dependent: :destroy
  validates :name, presence: true
  validates :started_at, presence: true

  def self.current
    Workout.where.not(started_at: nil)
    .where(finished_at: nil).first
  end

  def self.start_new!
    transaction do
      current&.destroy!
      create!
    end
  end

  def finish!
    update(finished_at: Time.zone.now)
  end
end
