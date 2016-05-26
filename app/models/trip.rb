class Trip < ActiveRecord::Base
  STATUS = %w(free to-be-confirmed chosen)
  belongs_to :user
  belongs_to :mission
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validates :departure_city, presence: true
  validates :arrival_city, presence: true
  validates :status, inclusion: {in: STATUS}
end
