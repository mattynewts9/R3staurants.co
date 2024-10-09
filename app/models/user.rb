class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :restaurants
  has_many :bookings
  has_many :reviews, through: :booking

  validates :first_name, :last_name, :image_url, presence: true
end
