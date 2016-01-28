class Vote < ActiveRecord::Base
  belongs_to :poll
  has_many :answers
  
  validates :cp, presence: true, length: {minimum: 4, maximum: 5}, numericality: true
  validates_associated :poll, :answers
end
