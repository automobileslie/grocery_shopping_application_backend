# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Purchase.delete_all
Receipt.delete_all
Item.delete_all

item_1 = Item.create!(short_description: "Mountain Dew 12pk", 
price: "6.49")

item_2 = Item.create!(short_description: "Emils Cheese Pizza", price: "12.25")

item_3 = Item.create!(short_description: "Skittles", 
price: "1.25")

item_4 = Item.create!(short_description: "Vitamins", 
price: "10.79")

item_5 = Item.create!(short_description: "Gold Leaf", price: "50.00")