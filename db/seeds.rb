require 'open-uri'

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
  { model: 'Falcon 900', price: 8000, available: false, user: default_user, capacity: 12, images: ['Falcon 900.png', 'Falcon900-2.png', 'Falcon900-3.png'] },
  { model: 'Gulfstream G650', price: 8500, available: true, user: user2, capacity: 14, images: ['Gulfstream G650.png', 'GulfstreamG650-2.png', 'GulfstreamG650-3.png'] },
  { model: 'Embraer', price: 4000, available: true, user: user2, capacity: 8, images: ['Embraer1.png', 'Embraer2.png', 'Embraer3.png'] },
  { model: 'Citation Ultra', price: 5000, available: true, user: user2, capacity: 7, images: ['Citation Ultra3.png', 'Citation Ultra2.png', 'Citation Ultra4.png'] },
  { model: 'Solar Impulse', price: 4000, available: true, user: user2, capacity: 1, images: ['Solar impulse.png', 'Solar Impulse2.png', 'Solar impulse.png'] },
  { model: 'Cesna', price: 4000, available: true, user: user2, capacity: 8, images: ['Cesna2.png', 'Cesna3.png', 'Cesna4.png'] },
  { model: 'Jet médical urgence', price: 5000, available: true, user: default_user, capacity: 7, images: ['Learjet2.png', 'Learjet1.png', 'Learjet4.png'] },
  { model: 'Learjet XR', price: 4000, available: true, user: default_user, capacity: 8, images: ['LearjetXR2.png', 'LearjetXR1.png', 'LearjetXR3.png'] },
  { model: 'F-14A', price: 12000, available: true, user: default_user, capacity: 1, images: ['Maverick.png', 'TopGun2.png', 'TopGun3.png'] },
  { model: 'Jet médical urgence', price: 5000, available: true, user: default_user, capacity: 7, images: ['Learjet2.png', 'Learjet1.png', 'Learjet4.png'] },
  { model: 'Learjet XR', price: 4000, available: true, user: user2, capacity: 8, images: ['LearjetXR2.png', 'LearjetXR1.png', 'LearjetXR3.png'] },
  { model: 'F-14A', price: 12000, available: true, user: user2, capacity: 1, images: ['Maverick.png', 'TopGun2.png', 'TopGun3.png'] }
]


jets_data.each do |jet_data|
  jet = Jet.new(jet_data.except(:images))

  jet_data[:images].each do |filename|
    # Attach image from the public folder
    file_path = Rails.root.join("public/#{filename}")
    if File.exist?(file_path)
      jet.images.attach(io: File.open(file_path), filename: filename, content_type: "image/png")
    else
      puts "Image file not found: #{file_path}"
    end
  end

  if jet.save
    puts "Jet #{jet.model} created successfully."
  else
    puts "Failed to create jet #{jet.model}: #{jet.errors.full_messages.join(', ')}"
  end
end

puts "Jet creation completed."

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
