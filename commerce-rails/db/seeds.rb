# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Membuat beberapa user dengan address-nya
3.times do |i|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  full_name = "#{first_name} #{last_name}"
  user = User.create!(
    name: full_name,
    email: "biocoba#{i}@yopmail.com",
    password: 'sandilagi'
  )

  # Membuat beberapa address untuk setiap user
  2.times do |j|
    user.addresses.create!(
      city: Faker::Address.city,
      street:  Faker::Address.street_address,
      postal_code: "12345#{j}"
    )
  end
end
puts "Created #{User.count} users with #{Address.count} addresses."

Shipper.create(carrier: 'JNE', city: 'KENDARI', cost: 80000)
Shipper.create(carrier: 'ANTERAJA', city: 'PALEMBANG', cost: 10000)
p "Create Shipper data"