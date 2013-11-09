class AverageReview < ActiveRecord::Base
  has_many :reviews
  attr_accessible :average_hours, :average_stress, :average_value
end
