class Booking < ApplicationRecord
  belongs_to :yacht
  belongs_to :user
  validates :yacht_id, presence: true
  validates :user_id, presence: true
  validates :start_date, presence: true
  validates_date :start_date, on_or_after: lambda { Date.current }
  validates_date :end_date, on_or_after: lambda { :start_date }
  validates :end_date, presence: true
end
