# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Album.destroy_all
User.destroy_all
Band.destroy_all

u1 = User.create(email: 'apple@apple.com', password: 'apples')
u2 = User.create(email: 'banana@banana.com', password: 'bananas')
u3 = User.create(email: 'grape@grape.com', password: 'grapes')
u4 = User.create(email: 'lily@lily.com', password: 'lilies')
u5 = User.create(email: 'melon@melon.com', password: 'melon')


b1 = Band.create(name: "fruits")
b2 = Band.create(name: "millions")
b3 = Band.create(name: "ladybug")
b4 = Band.create(name: "harmonic")
b5 = Band.create(name: "quantum")

a1 = Album.create(title:"delicious", year: 1921, band_id: b1.id, live: true)
a2 = Album.create(title:"hero", year: 1991, band_id: b2.id, live: true)
a3 = Album.create(title:"warming", year: 2021, band_id: b4.id, live: false)
a4 = Album.create(title:"fantastic", year: 1921, band_id: b1.id, live: true)