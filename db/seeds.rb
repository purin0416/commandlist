# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(1..25).each do |number|
  Command.create(name: 'test name ' + number.to_s, language: 'test language ' + number.to_s, content: 'test content ' + number.to_s)
end