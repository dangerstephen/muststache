# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Space.destroy_all

Space.create(location: 'San Francisco, ca', size: '10 x 10', space_type: 'Garage', description: 'Clean garage open for rent in safe neighborhood, easy access from street', title: 'Safe garage', user_id: '1', price: 4, latitude: 37.7749, longitude: 122.4194)
Space.create(location: 'Alameda, ca', size: '15 x 10', space_type: 'Shed', description: 'Spacious shed detached from main house, clean and safe from weather', title: 'cute storage', user_id: '2', price: 5, latitude: 37.8044, longitude: 122.2711)
Space.create(location: 'Fremont, ca', size: '20 x 20', space_type: 'Garage', description: 'Very BIG private garage with limited access to washer and dryer', title: 'unused garage', user_id: '13', price: 10, latitude: 37.5483, longitude: 121.9886)
Space.create(location: 'San Jose, ca', size: '50 x 10', space_type: 'Driveway', description: 'Open driveway near convention center for rent!', title: 'cheaper game day parking', user_id: '4', price: 7, latitude: 37.3382, longitude: 121.8863)
Space.create(location: 'San Mateo, ca', size: '300 sqft', space_type: 'Other', description: 'Detached in-law unit converted to a storage', title: 'backhouse storage', user_id: '5', price: 4, latitude: 37.5630, longitude: 122.3255)
Space.create(location: 'New York, ny', size: 'small', space_type: 'Other', description: 'Subletting small storage unit', title: 'discounted storage', user_id: '6', price: 3, latitude: 40.7128, longitude: 74.0059)
Space.create(location: 'Los Angeles, ca', size: '3 car driveway', space_type: 'Driveway', description: 'available parking spot in apartment complex', title: 'available parking spot', user_id: '7', price: 2, latitude: 34.0522, longitude: 118.2437)
Space.create(location: 'Austin, tx', size: 'large', space_type: 'Shed', description: 'Large exterior shed available with lock and climate control', title: 'cool storage', user_id: '8', price: 2, latitude: 30.2672, longitude: 97.7431)
Space.create(location: 'Seattle, wa', size: '10 by 15ft', space_type: 'Garage', description: 'Clean and dry garage great for storing things over the winter!', title: 'seasonal storage', user_id: '9', price: 2, latitude: 47.6062, longitude: 122.3321)
Space.create(location: 'Portland, or', size: '500 sqft', space_type: 'Shed', description: 'cool storage in basement of complext', title: 'cool storage', user_id: '10', price: 1, latitude: 45.5231, longitude: 122.6765)
