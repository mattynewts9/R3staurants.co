# db/seeds/reviews_seeder.rb

require 'faker'

# Clear existing records
Review.destroy_all if Rails.env.development?  # Avoids issues in production

booking_ids = Booking.pluck(:id)

# Generate fake reviews
def create_fake_reviews(booking_ids, count)
  count.times do
    Review.create(
      rating: rand(1..5),                       # Random rating between 1 and 5
      comments: Faker::Restaurant.review,       # Random comment from Faker
      booking_id: booking_ids.sample             # Randomly associate with one of the bookings
    )
  end
end

# Generate 20 fake reviews
create_fake_reviews(booking_ids, 20)

# Optionally add three specific reviews manually
Review.create(
  rating: 5,
  comments: "The food was absolutely amazing! Highly recommend the pasta!",
  booking_id: booking_ids.sample
)

Review.create(
  rating: 4,
  comments: "Great atmosphere and friendly staff, but the service was a bit slow.",
  booking_id: booking_ids.sample
)

Review.create(
  rating: 3,
  comments: "The food was decent, but I've had better experiences elsewhere.",
  booking_id: booking_ids.sample
)

puts "Seeded #{Review.count} reviews."
