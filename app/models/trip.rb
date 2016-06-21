class Trip < ActiveRecord::Base
  STATUS = %w(free to-be-confirmed chosen)
  belongs_to :user
  has_one :mission
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validates :departure_city, presence: true
  validates :arrival_city, presence: true
  validates :status, inclusion: {in: STATUS}


  GARE = ["Paris Gare de Lyon", "Paris Gare du Nord" , "Paris Gare Montparnasse", "Marseille Saint-Charles", "Bordeaux Saint-Jean", "Lyon Part Dieu", "Lyon Perrache", "Lille Europe", "Lille Flandres"]
end
