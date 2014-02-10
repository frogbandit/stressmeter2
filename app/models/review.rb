class Review < ActiveRecord::Base
  belongs_to :average_reviews
  attr_accessible :hours_spent, :name, :stress_level, :value
  before_create :set_defaults
  validates :hours_spent, :name, :stress_level, :value, presence: true
  

  private
  def set_defaults
  	self.hours_spent ||= 0
  	self.stress_level ||= 0
  	self.value ||= 0
  end
  
end
