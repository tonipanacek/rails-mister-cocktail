# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ingredient.destroy_all

require 'open-uri'
require 'json'

file = open("http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list")
p parsed = JSON.parse(file.read)

data = parsed["drinks"]

data.each do |hash|
  Ingredient.create!(name: hash["strIngredient1"])
end

