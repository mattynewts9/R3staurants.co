# Clear existing records
Review.destroy_all if Rails.env.development?
Booking.destroy_all
Restaurant.destroy_all
User.destroy_all

# Seed users
puts "Creating users..."
users = User.create!([
  { first_name: "John", last_name: "Doe", password: "password1", email: "john@example.com", image_url: "data:image/jpeg;base64,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"  },
  { first_name: "Jane", last_name: "Smith", password: "password", email: "jane@example.com", image_url: "data:image/jpeg;base64,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" }
])

# Seed data for restaurants
puts "Creating restaurants..."
restaurants = Restaurant.create!([
  {
    name: "The Gourmet Kitchen",
    description: "A fine dining restaurant with a seasonal menu.",
    location: "123 Fancy St, London",
    image_url: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/57/af/bc/just-2-mins-from-the.jpg?w=1200&h=-1&s=1",
    category: "Fine Dining",
    user: users.first
  },
  {
    name: "Cristie's Famous Pizza & Pasta",
    description: "Italian cuisine featuring handmade pasta and traditional dishes.",
    location: "456 Italian Rd, London",
    image_url: "https://www.iberkshires.com/images/feature/1637551465.jpg",
    category: "Italian",
    user: users.first
  },
  {
    name: "Sushi Haven",
    description: "A modern sushi bar with fresh and innovative dishes.",
    location: "789 Sushi Lane, Tokyo",
    image_url: "https://kosher-traveling.co.il/wp-content/uploads/sites/2/2024/03/London-Food-sushi-haven-2.jpeg",
    category: "Japanese",
    user: users.first
  },
  {
    name: "Taco Fiesta",
    description: "A vibrant Mexican restaurant serving authentic tacos and margaritas.",
    location: "101 Taco Blvd, Mexico City",
    image_url: "https://media-cdn.tripadvisor.com/media/photo-s/1b/fe/17/7e/taco-fiesta.jpg",
    category: "Mexican",
    user: users.first
  }
])

# Create bookings
puts "Creating bookings..."
50.times do
  start_date = Faker::Time.between(from: DateTime.now, to: 1.year.from_now)
  end_date = start_date + rand(1..14).days
  Booking.create!(
    start_date: start_date,
    end_date: end_date,
    user: users.sample,
    restaurant: restaurants.sample
  )
end
puts "Seeding done!"


puts "Creating reviews..."
Reviews = Review.create!([
  {
    rating: 5,
    comments: "The food was absolutely amazing! Highly recommend the pasta!",
    booking: Booking.first,

  },
  {
    rating: 4,
    comments: "Great atmosphere and friendly staff, but the service was a bit slow.",
    booking: Booking.second,
  },
  {
    rating: 3,
    comments: "The food was decent, but I've had better experiences elsewhere.",
    booking: Booking.third,
  }
])
