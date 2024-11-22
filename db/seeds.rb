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
  { model: 'Falcon 900', price: 8000, available: false, user: default_user, capacity: 12, image: 'Falcon 900.png', image1: 'Falcon900-2.png', image2: 'Falcon900-3.png'  },
  { model: 'Gulfstream G650', price: 8500, available: true, user: user2, capacity: 14, image: 'Gulfstream G650.png', image1: 'GulfstreamG650-2.png', image2: 'GulfstreamG650-3.png' },
  { model: 'Embraer', price: 4000, available: true, user: default_user, capacity: 8, image: 'Embraer1.png', image1:'Embraer2.png', image2: 'Embraer3.png' },
  { model: 'Citation Ultra', price: 5000, available: true, user: default_user, capacity: 7, image: 'Citation Ultra3.png', image1: 'Citation Ultra2.png', image2: 'Citation Ultra4.png' },
  { model: 'Solar Impulse', price: 4000, available: true, user: default_user, capacity: 1, image: 'Solar impulse.png', image1: 'Solar Impulse2.png', image2: 'Solar impulse.png' },
  { model: 'Cesna', price: 4000, available: true, user: default_user, capacity: 8, image: 'Cesna2.png', image1: 'Cesna3.png', image: 'Cesna4.png' },
  { model: 'Jet médical urgence', price: 5000, available: true, user: default_user, capacity: 7, image: 'Learjet2.png', image1: 'Learjet1.png', image2: 'Learjet4.png' },
  { model: 'Learjet XR', price: 4000, available: true, user: default_user, capacity: 8, image: 'LearjetXR2.png', image1: 'LearjetXR1.png', image2: 'LearjetXR3.png' },
  { model: 'F-14A', price: 12000, available: true, user: default_user, capacity: 1, image: 'Maverick.png', image1: 'TopGun2.png', image2: 'TopGun3.png' }
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
