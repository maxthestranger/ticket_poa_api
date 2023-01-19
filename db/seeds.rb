# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create all event categories
categories = [
  {
    name: "Music",
    cover_image: "music.jpg",
  },
  {
    name: "Sports",
    cover_image: "sports.jpg",
  },
  {
    name: "Theatre",
    cover_image: "theatre.jpg",
  },
  {
    name: "Comedy",
    cover_image: "comedy.jpg",
  },
  {
    name: "Film",
    cover_image: "film.jpg",
  },
  {
    name: "Exhibitions",
    cover_image: "exhibitions.jpg",
  },
  {
    name: "Conferences",
    cover_image: "conferences.jpg",
  },
  {
    name: "Festivals",
    cover_image: "festivals.jpg",
  },
  {
    name: "Family",
    cover_image: "family.jpg",
  },
  {
    name: "Food & Drink",
    cover_image: "food-and-drink.jpg",
  },
  {
    name: "Charity",
    cover_image: "charity.jpg",
  },
  {
    name: "Religious",
    cover_image: "religious.jpg",
  },
  {
    name: "Educational",
    cover_image: "educational.jpg",
  },
  {
    name: "Health & Well-being",
    cover_image: "health-and-well-being.jpg",
  },
  {
    name: "Other",
    cover_image: "other.jpg",
  },
]

categories.each do |category|
  Category.create!(category)
end

# Event.create(
#   "title": "Theatre",
#   "type": "offline",
#   "description": "where western theatre originated",
#   "venue_name": "Theatre",
#   "venue_url": "https://www.google.com/maps/place/1+Theatre+Square,+London+WC2H+8DP",
#   "start_date": "2021-01-01",
#   "end_date": "2021-01-01",
#   "poster": "theatre.jpg",
#   "category_id": 3,
#   "video_url": "https://www.youtube.com/watch?v=5qap5aO4i9A",
#   "live": true,
# )