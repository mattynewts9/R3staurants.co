class Restaurant < ApplicationRecord
  validates :name, :description, presence: true
  validates :email, :image_url, uniqueness: true
  validates :category, presence: true
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
end

# name"
#     t.string "description"
#     t.string "location"
#     t.string "image_url"
#     t.string "category"
