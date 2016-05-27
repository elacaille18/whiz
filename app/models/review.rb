class Review < ActiveRecord::Base
  belongs_to :mission
  belongs_to :user

  validates :content, presence: true
  validates :rating, presence:true
end
