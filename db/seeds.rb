# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# user = User.create!(email: 'test@hotmail.com')
# jet = Jet.create!(model: 'jet7455', price: "7255", available: true, capacity: 700)
# booking = Booking.create!(airport: 'CDG', jet: jet, user: user, start_date: '2025-01-11', end_date: '2025-02-11', special_requests: 'champagne')

# Création des utilisateurs
user1 = User.create!(
  email: 'alice@example.com',
  password: 'password123'
)

user2 = User.create!(
  email: 'bob@example.com',
  password: 'password123'
)

# Création des jets
jet1 = Jet.create!(
  model: 'Falcon 900',
  price: 5000,
  available: true,
  user: user1,  # Associé à user1
  capacity: 12,
  image:"Cesna1.png"
)

jet2 = Jet.create!(
  model: 'Gulfstream G650',
  price: 8000,
  available: true,
  user: user2,  # Associé à user2
  capacity: 14,
  image:"Citation Ulta4.png"
)

jet3 = Jet.create!(
  model: 'Cessna Citation X',
  price: 4000,
  available: false,
  user: user1,  # Associé à user1
  capacity: 8,
  image:"LearjetXR1.png"
)

# Création des réservations (bookings)
Booking.create!(
  airport: 'CDG',
  start_date: '2025-01-11',
  end_date: '2025-01-15',
  status: 'pending',
  special_requests: 'Champagne and flowers',
  jet: jet1,  # Associé à jet1
  user: user1  # Associé à user1
)

Booking.create!(
  airport: 'JFK',
  start_date: '2025-03-01',
  end_date: '2025-03-10',
  status: 'confirmed',
  special_requests: 'Vegetarian meal',
  jet: jet2,  # Associé à jet2
  user: user2  # Associé à user2
)

Booking.create!(
  airport: 'LHR',
  start_date: '2025-06-01',
  end_date: '2025-06-05',
  status: 'cancelled',
  special_requests: 'Window seat preference',
  jet: jet3,  # Associé à jet3 (jet non disponible)
  user: user1  # Associé à user1
)

puts "Seed data created successfully!"

