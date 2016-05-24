class Mission < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip
  validates :receiver_first_name, presence: true
  validates :receiver_last_name, presence: true
  validates :receiver_phone, presence: true
  validates :departure_city, presence: true
  validates :arrival_city, presence: true
  # validates :starts_on, presence: true
  # validates :timeslot, presence: true
  # validates :status, presence: true
  # validates :start_code, presence: true
  # validates :end_code, presence: true
  # validates :price, presence: true
  validates :parcel_description, presence: true
end
