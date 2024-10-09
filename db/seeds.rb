# db/seeds/reviews_seeder.rb

# Clear existing records
Review.destroy_all if Rails.env.development?  # Avoids issues in production

# Optionally add three specific reviews manually
Review.create(
  rating: 5,
  comments: "The food was absolutely amazing! Highly recommend the pasta!"
)

Review.create(
  rating: 4,
  comments: "Great atmosphere and friendly staff, but the service was a bit slow."
)

Review.create(
  rating: 3,
  comments: "The food was decent, but I've had better experiences elsewhere."
)

puts "Seeded #{Review.count} reviews."
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all

User.create!(
  [
    { first_name: "John", last_name: "Doe", password: "password1", email: "john@example.com" },
    { first_name: "Jane", last_name: "Smith", password: "password", email: "jane@example.com" }
  ]
)

# Seed data for restaurants
Restaurant.create!(
  [
    {
      name: "The Gourmet Kitchen",
      description: "A fine dining restaurant with a seasonal menu.",
      location: "123 Fancy St, London",
      image_url: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/57/af/bc/just-2-mins-from-the.jpg?w=1200&h=-1&s=1",
      category: "Fine Dining",
      user: User.first
    },
    {
      name: "Cristie's Famous Pizza & Pasta",
      description: "Italian cuisine featuring handmade pasta and traditional dishes.",
      location: "456 Italian Rd, London",
      image_url: "https://www.iberkshires.com/images/feature/1637551465.jpg",
      category: "Italian",
      user: User.first
    },
    {
      name: "Sushi Haven",
      description: "A modern sushi bar with fresh and innovative dishes.",
      location: "789 Sushi Lane, Tokyo",
      image_url: "https://kosher-traveling.co.il/wp-content/uploads/sites/2/2024/03/London-Food-sushi-haven-2.jpeg",
      category: "Japanese",
      user: User.first
    },
    {
      name: "Taco Fiesta",
      description: "A vibrant Mexican restaurant serving authentic tacos and margaritas.",
      location: "101 Taco Blvd, Mexico City",
      image_url: "https://media-cdn.tripadvisor.com/media/photo-s/1b/fe/17/7e/taco-fiesta.jpg",
      category: "Mexican",
      user: User.first
    }
  ]
)
