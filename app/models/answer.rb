class Answer < ActiveRecord::Base
  belongs_to :vote
  
  validates :question, presence: true
  validates :option, presence: true
  validates_associated :vote
end
