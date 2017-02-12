# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
require 'rest-client'
require 'nokogiri'

page = 1
while page < 15
  html_file = open("http://www.epicurious.com/tools/searchresults?search=poulet&pageNumber=#{page}")
  html_doc = Nokogiri::HTML(html_file)
  recipes = html_doc.search('.sr_rows')
  recipes.each do |recipe|
    name = recipe.search('.recipeLnk').text
    Recipe.create!(name: name)
  end
page += 1
end
