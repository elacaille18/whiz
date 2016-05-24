class Mission < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip
end
