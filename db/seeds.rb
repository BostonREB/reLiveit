# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


ARTIST_NAMES = [
  "Drive-By Truckers",
  "My Morning Jacket",
  "Umphreys McGee",
  "Grace Potter and the Nocturnals",
  "Yonder Mountain String Band",
  "Camper Van Beethoven",
  "John Butler Trio",
  "Guster",
  "John Mayer",
  "Further",
  "Patterson Hood",
  "Matisyahu",
  "Smashing Pumpkins",
  "String Cheese Incident",
  "moe."
]

ARTIST_NAMES.each do |artist_name|
  Artist.create(name: artist_name)
end
