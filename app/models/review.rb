class Review < ApplicationRecord
  belongs_to :booking
  validates :rating, inclusion: { in: 1..5 }
  validates :comments, presence: true  # Ensure this line is present for validation
end
