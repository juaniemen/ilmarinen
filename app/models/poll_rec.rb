class PollRec < ActiveRecord::Base
  has_many :counts

  # validates :sku, presence: true, uniqueness: true
  validates :name, presence: true
  validates :lastModification, presence: true
  validates_associated :counts
  
end
