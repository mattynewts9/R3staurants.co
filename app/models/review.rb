class Review < ApplicationRecord
  belongs_to :booking

  validates :comments, :rating, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 1.0, less_than_or_equal_to: 5.0 }
end
