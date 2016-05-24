class Trip < ActiveRecord::Base

  belongs_to :user
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validates :departure_city, presence: true
  validates :arrival_city, presence: true

end
