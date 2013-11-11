# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
b = Blog.new()
b.title = "Cars"
b.content = "Actual content goes here"
b.save

b = Blog.new()
b.title = "Trains"
b.content = "Actual content goes here"
b.save

b = Blog.new()
b.title = "Buses"
b.content = "Actual content goes here"
b.save