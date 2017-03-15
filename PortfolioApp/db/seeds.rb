# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bubah = User.create(first_name: 'Bub', last_name: 'Con', email: 'contehb@gmail.com', password: 'Lebron23!', password_confirmation: 'Lebron23!', role: 'admin')

kofis = User.create(first_name: 'kofis', last_name: 'fad', email: 'kofis@gmail.com', password: 'kofis', password_confirmation: 'kofis', role: 'editor')