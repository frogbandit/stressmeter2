class Review < ActiveRecord::Base
  attr_accessible :hours_spent, :name, :stress_level, :value
end
