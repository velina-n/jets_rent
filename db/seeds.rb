puts "Nettoyage de la base de données...."
Booking.destroy_all
Jet.destroy_all
User.destroy_all
puts "Base de données nettoyée."

# Créer des utilisateurs
puts "Création des utilisateurs..."
default_user = User.find_or_create_by!(email: "default@example.com") do |user|
  user.password = "password123"
end
user2 = User.find_or_create_by!(email: "user2@example.com") do |user|
  user.password = "password456"
end
puts "Utilisateurs créés : #{User.count}"

# Création des jets
puts "Création des jets"
jets_data = [
  { model: 'Falcon 900', price: 8000, available: false, user: default_user, capacity: 12 },
  { model: 'Gulfstream G650', price: 8500, available: true, user: user2, capacity: 14 },
  { model: 'Cesna', price: 4000, available: true, user: default_user, capacity: 8 },
  { model: 'Citation Ultra', price: 5000, available: true, user: default_user, capacity: 7 },
  { model: 'Solar Impulse', price: 4000, available: true, user: default_user, capacity: 1 },
  { model: 'Embraer', price: 4000, available: true, user: default_user, capacity: 8 },
  { model: 'Learjet', price: 5000, available: true, user: default_user, capacity: 7 },
  { model: 'Learjet XR', price: 4000, available: true, user: default_user, capacity: 8 },
  { model: 'Rafale', price: 12000, available: true, user: default_user, capacity: 1 }
]

jets_data.each do |jet_data|
  jet = Jet.new(jet_data)
  jet.skip_image_validation = true # Désactive temporairement la validation des images
  jet.save!
end

puts "Jets créés : #{Jet.count}"

# Création des réservations
puts "Création des réservations"
begin
  Booking.create!(
    airport: 'CDG',
    start_date: '2025-01-11',
    end_date: '2025-01-15',
    status: 'pending',
    special_requests: 'Champagne and flowers',
    jet: Jet.first,
    user: default_user
  )
  Booking.create!(
    airport: 'JFK',
    start_date: '2025-03-01',
    end_date: '2025-03-10',
    status: 'accepted',
    special_requests: 'Vegetarian meal',
    jet: Jet.second,
    user: user2
  )
rescue ActiveRecord::RecordInvalid => e
  puts "Erreur lors de la création d'une réservation : #{e.message}"
end

puts "Réservations créées : #{Booking.count}"
puts "Seed data created successfully!"
