class Poll < ActiveRecord::Base
  has_many :votes

  validates :name, presence: true
  validates_associated :votes
  
end
