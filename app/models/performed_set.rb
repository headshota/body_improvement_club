class PerformedSet < ApplicationRecord
  belongs_to :performed_exercise

  def done
    self.done_at.present?
  end
  alias_method :done?, :done

  def done=(val)
    if val.present? && val != "0"
      self.done_at = Time.current
    else
      self.done_at = nil
    end
  end
end
