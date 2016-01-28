class CountCp < Count
  attr_accessor :cp


  validates :cp, presence: true, numericality: true, length: {minimum: 4, maximum: 5}
end
