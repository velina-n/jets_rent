puts "Nettoyage de la base de données...."
Booking.destroy_all
Jet.destroy_all
User.destroy_all
puts "Base de données nettoyée."

# Création des utilisateurs
puts "Création des utilisateurs"
user1 = User.create!(email: 'alice@example.com', password: 'password123')
user2 = User.create!(email: 'bob@example.com', password: 'password123')
puts "Utilisateurs créés : #{User.count}"

# Création des jets
puts "Création des jets"
jet1 = Jet.create!(model: 'Falcon 900', price: 8000, available: false, user: user1, capacity: 12, image: "Falcon 900.png")
jet2 = Jet.create!(model: 'Gulfstream G650', price: 8500, available: true, user: user2, capacity: 14, image: "Gulfstream G650.png")
jet3 = Jet.create!(model: 'Cesna', price: 4000, available: true, user: user1, capacity: 8, image: "Cesna1.png")
jet4 = Jet.create!(model: 'Citation Ultra', price: 5000, available: true, user: user1, capacity: 7, image: "Citation Ultra3.png")
jet5 = Jet.create!(model: 'Solar Impulse', price: 4000, available: true, user: user1, capacity: 1, image: "Solar impulse.png")
jet6 = Jet.create!(model: 'Embraer', price: 4000, available: true, user: user1, capacity: 8, image: "Embraer.png")
jet7 = Jet.create!(model: 'Learjet', price: 5000, available: true, user: user1, capacity: 7, image: "Learjet2.png")
jet8 = Jet.create!(model: 'Learjet XR', price: 4000, available: true, user: user1, capacity: 8, image: "LearjetXR2.png")
jet9 = Jet.create!(model: 'Rafale', price: 12000, available: true, user: user1, capacity: 1, image: "Maverick.png")

puts "Jets créés : #{Jet.count}"

# Vérification des dépendances
puts "Vérification des dépendances :"
puts "User 1 existe ? #{user1.present?}"
puts "Jet 1 existe ? #{jet1.present?}"

# Création des réservations
puts "Création des réservations"
begin
  Booking.create!(
    airport: 'CDG',
    start_date: '2025-01-11',
    end_date: '2025-01-15',
    status: 'pending',
    special_requests: 'Champagne and flowers',
    jet: jet1,
    user: user1
  )
  Booking.create!(
    airport: 'JFK',
    start_date: '2025-03-01',
    end_date: '2025-03-10',
    status: 'confirmed',
    special_requests: 'Vegetarian meal',
    jet: jet2,
    user: user2
  )
rescue ActiveRecord::RecordInvalid => e
  puts "Erreur lors de la création d'une réservation : #{e.message}"
end

puts "Réservations créées : #{Booking.count}"
puts "Seed data created successfully!"
