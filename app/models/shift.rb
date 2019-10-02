class Shift < ApplicationRecord
  belongs_to :user
  delegate :organization, to: :user
  def shift_length
    self.finish - self.start
  end

  def hours_worked
    shift_in_seconds = shift_length - (self.break_length * 60)
    (shift_in_seconds / 3600).round(2)
  end

  def shift_cost
    (hours_worked * Organization.find(User.find(self.user_id).organization_id).rate).round(2)
  end

end
