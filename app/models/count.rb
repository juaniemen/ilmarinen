class Count < ActiveRecord::Base
  belongs_to :pollRec
  
  validates :question, presence: true
  validates :option, presence: true
  validates :optionCount, presence: true, numericality: {greater_than_or_equal_to: 0} 
  validates_associated :pollRec
end
