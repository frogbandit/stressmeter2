class Review < ActiveRecord::Base
  belongs_to :average_reviews
  attr_accessible :hours_spent, :name, :stress_level, :value

  
end
